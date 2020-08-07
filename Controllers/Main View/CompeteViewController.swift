//
//  CompeteViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 9/12/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit
import Firebase

class CompeteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    //Get user data...
    let user = try! JSONDecoder().decode(User.self, from: UserDefaults.standard.value(forKey: "currentUser") as! Data)
    
    //Set up the error alert
    let alert = UIAlertController(title: "No Connection", message: "It appears that you have lost internet connetion. Please check your internet connection and try again.", preferredStyle: .alert)
    
    //@IBOutlets
    @IBOutlet weak var competeSearchBar: UISearchBar!
    @IBOutlet weak var competeResultsTableView: UITableView!
    
    //User's info collectors
    var usernames = [String]()
    var userData = [String: Int]() {
        didSet {
            self.competeResultsTableView.reloadData()
        }
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Set up the table view
        self.setUpTableView()
        
        //Make the search bar the first responder
        self.competeSearchBar.becomeFirstResponder()
        
        //Set up the tap gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.view.addGestureRecognizer(tap)
        
        //Check to see if user wants to share data
        let ref = Database.database().reference().child("usernames").child(self.user.username)
        ref.child("shareData").observeSingleEvent(of: .value, with: { (snapshot) in
            if let value = snapshot.value as? Bool {
                if !value {
                    let alert = UIAlertController(title: "Compete Mode Disabled", message: "You will not be able to see others' usernames and star counts, and they will not be able to see yours. You can change this at any time.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action) in
                        self.tabBarController?.selectedIndex = 0
                    }))
                    self.present(alert, animated: true)
                } else {
                    return
                }
            } else {
                let alert = UIAlertController(title: "Compete With Others?", message: "Would you like to be able to compete and compare star counts against other users? This will allow you to see other users' usernames and star counts but will also allow them to see yours.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                    ref.child("shareData").setValue(true, withCompletionBlock: { (error, dr) in
                        if let error = error {
                            self.alertFailure(error)
                        }
                    })
                }))
                alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: { (action) in
                    let alert = UIAlertController(title: "Compete Mode Disabled", message: "You will not be able to see others' usernames and star counts, and they will not be able to see yours. You can change this at any time.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (action) in
                        ref.child("shareData").setValue(false, withCompletionBlock: { (error, dr) in
                            if let error = error {
                                self.alertFailure(error)
                            }
                        })
                        self.tabBarController?.selectedIndex = 0
                    }))
                    self.present(alert, animated: true)
                }))
                
                self.present(alert, animated: true)
            }
        })
        
    }
    
    func setUpTableView() {
        
        //No selections for this table view
        self.competeResultsTableView.allowsSelection = false
        
        //Required setting of delegates and data sources
        self.competeSearchBar.delegate = self
        self.competeResultsTableView.delegate = self
        self.competeResultsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "competeTableViewCell", for: indexPath) as! CompeteTableViewCell
        print(userData.keys)
        
        print(cell.usernameLabel)
        print(cell.starsLabel)
        
        cell.usernameLabel.text = Array(userData.keys)[indexPath.row]
        cell.starsLabel.text = String(Array(userData.values)[indexPath.row])
        
        return cell
    }
    
    func alertFailure(_ error: Error) {
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func loadUsers(text: String) {
        self.competeSearchBar.resignFirstResponder()
        CompeteUserFinderService.findCompetitors(contains: text, completion: { (usernames) in
            print("I got this: ")
            print(usernames)
            print("lolol")
            CompeteUserFinderService.getData(usernames) { (userData) in
                self.userData = userData
                print(userData)
            }
            
        })
        
        
    }
    
    //When the Search button on keyboard is clicked, the table view will reload and the search results will pop up
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = competeSearchBar.text {
            self.loadUsers(text: searchText)
        } else {
            return
        }
        
    }
    //When the screen is tapped, the table view will reload and the search results will pop up
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if let searchText = competeSearchBar.text {
            self.loadUsers(text: searchText)
        } else {
            return
        }
        
    }

}
