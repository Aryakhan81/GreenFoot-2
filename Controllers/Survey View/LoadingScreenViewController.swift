//
//  LoadingScreenViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/31/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AEXML
import Firebase

class LoadingScreenViewController: UIViewController {
    @IBOutlet weak var loading: UILabel!
    
    var userData: Data?
    var user: User?
    let alert = UIAlertController(title: "No Connection", message: "It appears that you have lost internet connetion. Please check your internet connection and try again.", preferredStyle: .alert)
    
    var params: Parameters = [:]
    
    var abbv: String? {
        didSet {
            info.internal_state_abbreviation = self.abbv!
            
            params = ["input_location": info.input_location!,
                      "input_income": info.input_income!,
            "input_location_mode": info.input_location_mode,
            "input_size": info.input_size!,
            "input_footprint_transportation_miles1": info.input_footprint_transportation_miles1!,
            "input_footprint_transportation_mpg1": info.input_footprint_transportation_mpg1!,
            "input_footprint_transportation_fuel1": info.input_footprint_transportation_fuel1,
            "input_footprint_transportation_miles2": info.input_footprint_transportation_miles2!,
            "input_footprint_transportation_mpg2": info.input_footprint_transportation_mpg2!,
            "input_footprint_transportation_fuel2": info.input_footprint_transportation_fuel2,
            "input_footprint_transportation_miles3": info.input_footprint_transportation_miles3!,
            "input_footprint_transportation_mpg3": info.input_footprint_transportation_mpg3!,
            "input_footprint_transportation_fuel3": info.input_footprint_transportation_fuel3,
            "input_footprint_transportation_miles4": info.input_footprint_transportation_miles4!,
            "input_footprint_transportation_mpg4": info.input_footprint_transportation_mpg4!,
            "input_footprint_transportation_fuel4": info.input_footprint_transportation_fuel4,
            "input_footprint_transportation_miles5": info.input_footprint_transportation_miles5,
            "input_footprint_transportation_mpg5": info.input_footprint_transportation_mpg5,
            "input_footprint_transportation_fuel5": info.input_footprint_transportation_fuel5,
            "input_footprint_transportation_miles6": info.input_footprint_transportation_miles6,
            "input_footprint_transportation_mpg6": info.input_footprint_transportation_mpg6,
            "input_footprint_transportation_fuel6": info.input_footprint_transportation_fuel6,
            "input_footprint_transportation_miles7": info.input_footprint_transportation_miles7,
            "input_footprint_transportation_mpg7": info.input_footprint_transportation_mpg7,
            "input_footprint_transportation_fuel7": info.input_footprint_transportation_fuel7,
            "input_footprint_transportation_miles8": info.input_footprint_transportation_miles8,
            "input_footprint_transportation_mpg8": info.input_footprint_transportation_mpg8,
            "input_footprint_transportation_fuel8": info.input_footprint_transportation_fuel8,
            "input_footprint_transportation_miles9": info.input_footprint_transportation_miles9,
            "input_footprint_transportation_mpg9": info.input_footprint_transportation_mpg9,
            "input_footprint_transportation_fuel9": info.input_footprint_transportation_fuel9,
            "input_footprint_transportation_miles10": info.input_footprint_transportation_miles10,
            "input_footprint_transportation_mpg10": info.input_footprint_transportation_mpg10,
            "input_footprint_transportation_fuel10": info.input_footprint_transportation_fuel10,
            "input_footprint_transportation_num_vehicles": info.input_footprint_transportation_num_vehicles,
            "input_footprint_transportation_airtype": info.input_footprint_transportation_airtype,
            "input_footprint_transportation_airtotal": info.input_footprint_transportation_airtotal!,
            "input_footprint_transportation_groundtype": info.input_footprint_transportation_groundtype,
            "input_footprint_transportation_publictrans": info.input_footprint_transportation_publictrans!,
            "internal_state_abbreviation": info.internal_state_abbreviation!,
            "input_footprint_housing_electricity_type": info.input_footprint_housing_electricity_type,
            "input_footprint_housing_electricity_dollars": info.input_footprint_housing_electricity_dollars!,
            "input_footprint_housing_cleanpercent": info.input_footprint_housing_cleanpercent,
            "input_footprint_housing_naturalgas_type": info.input_footprint_housing_naturalgas_type,
            "input_footprint_housing_naturalgas_dollars": info.input_footprint_housing_naturalgas_dollars!,
            "input_footprint_housing_heatingoil_type": info.input_footprint_housing_heatingoil_type,
            "input_footprint_housing_heatingoil_dollars": info.input_footprint_housing_heatingoil_dollars!,
            "input_footprint_housing_heatingoil_dollars_per_gallon": info.input_footprint_housing_heatingoil_dollars_per_gallon,
            "input_footprint_housing_watersewage": info.input_footprint_housing_watersewage!,
            "input_footprint_housing_squarefeet": info.input_footprint_housing_squarefeet!,
            "input_footprint_household_adults": info.input_footprint_household_adults!,
            "input_footprint_household_children": info.input_footprint_household_children!,
            "input_changed": info.input_changed,
            "input_footprint_shopping_food_meattype": info.input_footprint_shopping_food_meattype,
            "input_footprint_shopping_food_meatfisheggs": info.input_footprint_shopping_food_meatfisheggs!,
            "input_footprint_shopping_food_dairy": info.input_footprint_shopping_food_dairy!,
            "input_footprint_shopping_food_otherfood": info.input_footprint_shopping_food_otherfood!,
            "input_footprint_shopping_food_fruitvegetables": info.input_footprint_shopping_food_fruitvegetables!,
            "input_footprint_shopping_food_cereals": info.input_footprint_shopping_food_cereals!,
            "input_footprint_shopping_goods_default_furnitureappliances": info.input_footprint_shopping_goods_default_furnitureappliances!,
            "input_footprint_shopping_goods_default_clothing": info.input_footprint_shopping_goods_default_clothing!,
            "input_footprint_shopping_goods_default_other_entertainment": info.input_footprint_shopping_goods_default_other_entertainment!,
            "input_footprint_shopping_goods_default_other_office": info.input_footprint_shopping_goods_default_other_office!,
            "input_footprint_shopping_goods_default_other_personalcare": info.input_footprint_shopping_goods_default_other_personalcare!,
            "input_footprint_shopping_goods_default_other_autoparts": info.input_footprint_shopping_goods_default_other_autoparts!,
            "input_footprint_shopping_goods_default_other_medical": info.input_footprint_shopping_goods_default_other_medical!,
            "input_footprint_shopping_goods_type": info.input_footprint_shopping_goods_type,
            "input_footprint_shopping_goods_total": info.input_footprint_shopping_goods_total!,
            "input_footprint_shopping_services_type": info.input_footprint_shopping_services_type,
            "input_footprint_shopping_services_total": info.input_footprint_shopping_services_total!,
            "input_footprint_housing_gco2_per_kwh": info.input_footprint_housing_gco2_per_kwh,
            "input_footprint_housing_hdd": info.input_footprint_housing_hdd!,
            "input_footprint_housing_cdd": info.input_footprint_housing_cdd!,
            "app_id": appInfo.AppID,
            "app_key": appInfo.AppKey]
            
            self.calculateFootprint()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Get user data...
        userData = (UserDefaults.standard.value(forKey: "currentUser") as! Data)
        user = try! JSONDecoder().decode(User.self, from: userData!)
        
        if let stateAbbv = info.internal_state_abbreviation {
            self.abbv = stateAbbv
        } else {
            let apiToContact = "https://api.zip-codes.com/ZipCodesAPI.svc/1.0/GetZipCodeDetails/\(info.input_location!)?key=\(appInfo.zipcodeAppKey)"
            
            Alamofire.request(apiToContact).validate().responseJSON { (response) in
                switch response.result {
                case .success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        let state = ZipCode(json: json)
                        self.abbv = state.stateAbbv
                    }
                case .failure(let error):
                    self.alertFailure(error)
                }
            }
        }
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
    
    func calculateFootprint() {
        let apiToContact = "https://apis.berkeley.edu/coolclimate/footprint?"
        let apiURL = URL(string: apiToContact)!
        
        Alamofire.request(apiURL, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).validate().response { (response) in
            guard let xml = response.data else { return }
            var options = AEXMLOptions()
            options.parserSettings.shouldProcessNamespaces = false
            options.parserSettings.shouldReportNamespacePrefixes = false
            options.parserSettings.shouldResolveExternalEntities = false
            
            do {
                let xmlDoc = try AEXMLDocument(xml: xml, options: options)
                let value = xmlDoc.root["result_grand_total"].value!
                let ref = Database.database().reference().child("users").child(self.user!.uid)
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
                            
                            let starsUsernameRef = Database.database().reference().child("usernames").child(self.user!.uid).child("stars")
                            starsUsernameRef.setValue(0, withCompletionBlock: { (error, sur) in
                                if let error = error {
                                    self.alertFailure(error)
                                }
                            })
                            
                            let initialViewController = UIStoryboard.initialViewController(for: .main)
                            self.view.window?.rootViewController = initialViewController
                            self.view.window?.makeKeyAndVisible()
                        })
                    })
                })
               
            } catch (let error){
                self.alertFailure(error)
            }

        }
    }
    
    func alertFailure(_ error: Error) {
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action) in
            self.loading.text! = error.localizedDescription
        }))
        self.present(alert, animated: true)
    }

}
