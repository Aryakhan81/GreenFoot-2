//
//  BasicResultsViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 8/13/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit
import Alamofire
import AEXML
import Firebase

class BasicResultsViewController: UIViewController {
    
    //@IBOutlets
    @IBOutlet weak var loading: UILabel!
    @IBOutlet weak var fullSurvey: UIButton!
    @IBOutlet weak var toHome: UIButton!
    
    var stateAbbv: String?
    var zipCode: String?
    
    let user = try! JSONDecoder().decode(User.self, from: (UserDefaults.standard.value(forKey: "currentUser") as! Data))
    let alert = UIAlertController(title: "No Connection", message: "It appears that you have lost internet connetion. Please check your internet connection and try again.", preferredStyle: .alert)
    let params: Parameters = ["input_location": basicInfo.input_location!, "input_income": basicInfo.input_income!, "input_location_mode": basicInfo.input_location_mode!, "input_size": basicInfo.input_size!, "app_id": appInfo.AppID, "app_key": appInfo.AppKey]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Style
        self.fullSurvey.layer.cornerRadius = 8
        self.toHome.layer.cornerRadius = 8
        
        let apiToContact = "https://apis.berkeley.edu/coolclimate/footprint-defaults?"
        let apiURL = URL(string: apiToContact)!
        Alamofire.request(apiURL, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).validate().response { (response) in
            guard let xml = response.data else { return }
            var options = AEXMLOptions()
            options.parserSettings.shouldProcessNamespaces = false
            options.parserSettings.shouldReportNamespacePrefixes = false
            options.parserSettings.shouldResolveExternalEntities = false
            
            do {
                let xmlDoc = try AEXMLDocument(xml: xml, options: options)
                if let value = xmlDoc.root["result_grand_total"].value {
                    self.stateAbbv = xmlDoc.root["internal_state_abbreviation"].value!
                    let location = xmlDoc.root["input_location"].value!
                    
                    if location.count == 5 {
                        self.zipCode = location
                    }
                    
                    let ref = Database.database().reference().child("users").child(self.user.uid)
                    let footprintRef = ref.child("carbonFootprint")
                    footprintRef.setValue(Double(value)!, withCompletionBlock: { (error, reference) in
                        if let error = error {
                            self.alertFailure(error)
                        }
                    })
                    
                    let rawMissions = xmlDoc.root["result_takeaction_pounds"].value!
                    let missions = self.convertToDictionary(text: rawMissions)!.filter { $0.value as! Double > 0 }
                    
                    let missionRef = ref.child("missions")
                    missionRef.setValue(missions, withCompletionBlock: { (error, mr) in
                        if let error = error {
                            self.alertFailure(error)
                        }
                        
                        let reducedRef = ref.child("carbonReduced")
                        reducedRef.setValue(0, withCompletionBlock: { (error, rr) in
                            if let error = error {
                                self.alertFailure(error)
                            }
                            
                            let starsRef = ref.child("stars")
                            starsRef.setValue(0, withCompletionBlock: { (error, sr) in
                                if let error = error {
                                    self.alertFailure(error)
                                }
                                
                                let starsUsernameRef = Database.database().reference().child("usernames").child(self.user.uid).child("stars")
                                starsUsernameRef.setValue(0, withCompletionBlock: { (error, sur) in
                                    if let error = error {
                                        self.alertFailure(error)
                                    }
                                })
                                
                                self.loading.text = "\(Double(value)!.round(to: 3)) tons/year"
                            })
                        })
                    })
                    
                } else {
                    self.loading.text! = "Whoops! Something went wrong! Please quit the app and try again!"
                }
               
            } catch (let error){
                self.alertFailure(error)
            }
        }

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? InitialSurveyViewController {
            if let zipCode = zipCode {
                destination.zipCode = zipCode
            }
            destination.housePop = String(basicInfo.input_size!)
            destination.incomeRow = basicInfo.input_income! - 1
            info.internal_state_abbreviation = stateAbbv
        }
    }
    
    @IBAction func fullSurveyButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "basicToSurvey", sender: self)
    }
    
    @IBAction func toHomeButtonPressed(_ sender: UIButton) {
        let initialViewController = UIStoryboard.initialViewController(for: .main)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    func alertFailure(_ error: Error) {
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action) in
            self.loading.text! = error.localizedDescription
        }))
        self.present(alert, animated: true)
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                return [:]
            }
        }
        return nil
    }


}
