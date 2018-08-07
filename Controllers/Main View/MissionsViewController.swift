//
//  MissionsViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/24/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit
import Firebase

protocol MissionTableViewCellDelegate: class {
    func tappedComplete(_ sender: MissionTableViewCell)
}

class MissionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var missions: [String: Double] = [:]
    var missionsList: [(key: String, value: Double)] = [] {
        didSet {
            self.refreshLabels(false)
            self.missionsTableView.reloadData()
        }
    }
    
    //Get user data...
    let user = try! JSONDecoder().decode(User.self, from: UserDefaults.standard.value(forKey: "currentUser") as! Data)
    
    //@IBOutlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var carbonFootprintLabel: UILabel!
    @IBOutlet weak var missionsTableView: UITableView!
    @IBOutlet weak var footprintDescription: UILabel!
    @IBOutlet weak var missionsDescription: UILabel!
    
    @objc func tappedComplete(_ sender: UIButton) {
        let alert = UIAlertController(title: "Complete Mission", message: "Are you sure that you would like to complete this mission? This will delete it from your list of missions.", preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default) { (action) in
            let ref = Database.database().reference().child("users").child(self.user.uid)
            ref.observeSingleEvent(of: .value) { (snapshot) in
                let value = snapshot.value as! [String: Any]
                let footprint = value["carbonFootprint"] as! Double
                let newFootprint = footprint - self.missionsList[sender.tag].value
                let reduced = value["carbonReduced"] as! Double
                let stars = (value["stars"] as! Int)
                
                ref.child("carbonReduced").setValue(reduced + self.missionsList[sender.tag].value, withCompletionBlock: { (error, rr) in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    
                    ref.child("stars").setValue(stars + Int(self.missionsList[sender.tag].value * 100), withCompletionBlock: { (error, sr) in
                        if let error = error {
                            print(error.localizedDescription)
                        }
                        
                        self.missionsList.remove(at: sender.tag)
                        self.missionsTableView.reloadData()
                        
                        ref.child("missions").setValue(self.toDict(self.missionsList), withCompletionBlock: { (error, mr) in
                            if let error = error {
                                print(error.localizedDescription)
                            }
                            
                            ref.child("carbonFootprint").setValue(newFootprint, withCompletionBlock: { (error, cr) in
                                if let error = error {
                                    print(error.localizedDescription)
                                }
                                DispatchQueue.main.async {
                                    self.carbonFootprintLabel.text = "\(newFootprint.round(to: 2)) tons/year"
                                }
                                
                            })
                            
                        })
                        
                    })
                })
            }
        })
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "missionsTableViewCell", for: indexPath) as! MissionTableViewCell
        let description = ((missionsList[indexPath.row].key).capitalized).replacingOccurrences(of: "_", with: " ")
        let missionText = "\(description) to reduce footprint by \(missionsList[indexPath.row].value) tons/year"
        cell.completeButton.tag = indexPath.row
        cell.completeButton.addTarget(self, action: #selector(tappedComplete(_:)), for: .touchUpInside)
        cell.missionText.text = missionText
        if UIDevice.modelName == "iPhone 5" || UIDevice.modelName == "iPhone 5c" || UIDevice.modelName == "iPhone 5s" || UIDevice.modelName == "iPhone SE" {
            cell.missionText.font = UIFont.systemFont(ofSize: 13)
        } else if UIDevice.modelName == "iPhone 6" || UIDevice.modelName == "iPhone 6s" || UIDevice.modelName == "iPhone 7" || UIDevice.modelName == "iPhone 8" {
            cell.missionText.font = UIFont.systemFont(ofSize: 15)
        } else if UIDevice.modelName == "iPhone 6 Plus" || UIDevice.modelName == "iPhone 6s Plus" || UIDevice.modelName == "iPhone 7 Plus" || UIDevice.modelName == "iPhone 8 Plus" {
            cell.missionText.font = UIFont.systemFont(ofSize: 16)
        } else {
            cell.missionText.font = UIFont.systemFont(ofSize: 16)
        }
    
        return cell
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        //ONLY TEMPORARY, UNTIL USER CAN TAP ON TABLE VIEW CELLS:
        self.missionsTableView.allowsSelection = false
        
        self.missionsTableView.delegate = self
        self.missionsTableView.dataSource = self
        self.refreshLabels(true)
        self.missionsTableView.reloadData()
        
        //Style
        missionsTableView.layer.cornerRadius = 8
        missionsTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        if UIDevice.modelName == "iPhone 5" || UIDevice.modelName == "iPhone 5c" || UIDevice.modelName == "iPhone 5s" || UIDevice.modelName == "iPhone SE" {
            self.carbonFootprintLabel.font = UIFont.systemFont(ofSize: 18)
            self.footprintDescription.font = UIFont.boldSystemFont(ofSize: 18)
            self.missionsDescription.font = UIFont.systemFont(ofSize: 16.5)
        } else if UIDevice.modelName == "iPhone 6" || UIDevice.modelName == "iPhone 6s" || UIDevice.modelName == "iPhone 7" || UIDevice.modelName == "iPhone 8" {
            self.carbonFootprintLabel.font = UIFont.systemFont(ofSize: 22)
            self.footprintDescription.font = UIFont.boldSystemFont(ofSize: 22)
            self.missionsDescription.font = UIFont.systemFont(ofSize: 19.5)
        } else if UIDevice.modelName == "iPhone 6 Plus" || UIDevice.modelName == "iPhone 6s Plus" || UIDevice.modelName == "iPhone 7 Plus" || UIDevice.modelName == "iPhone 8 Plus" {
            self.carbonFootprintLabel.font = UIFont.systemFont(ofSize: 24)
            self.footprintDescription.font = UIFont.boldSystemFont(ofSize: 24)
            self.missionsDescription.font = UIFont.systemFont(ofSize: 21)
        } else {
            self.carbonFootprintLabel.font = UIFont.systemFont(ofSize: 22)
            self.footprintDescription.font = UIFont.boldSystemFont(ofSize: 22)
            self.missionsDescription.font = UIFont.systemFont(ofSize: 20)
        }
        
        //...and set the labels to its values!
        usernameLabel.text = user.username
        
    }
    
    func refreshLabels(_ updateLists: Bool) {
        let ref = Database.database().reference().child("users").child(user.uid)
        ref.observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as! [String: Any]
            self.carbonFootprintLabel.text = "\((value["carbonFootprint"] as! Double).round(to: 2)) tons/year"
            if updateLists {
                let missions: [String: Double]? = value["missions"] as? [String: Double]
                if missions != nil {
                    self.missions = missions!
                } else {
                    self.missions = [:]
                }
                self.missionsList = Array(self.missions)
            }

        }
    }
    
    func toDict<K,V>(_ tuples: [(K, V)]) -> [K: V]{
        var dict:[K: V] = [K: V]()
        tuples.forEach { dict[$0.0] = $0.1 }
        return dict
    }

}
