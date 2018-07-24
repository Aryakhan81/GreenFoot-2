//
//  MissionsViewController.swift
//  GreenFoot
//
//  Created by Arya Gharib on 7/24/18.
//  Copyright © 2018 Sina Gharib. All rights reserved.
//

import UIKit

class MissionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //@IBOutlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var carbonFootprintLabel: UILabel!
    @IBOutlet weak var missionsTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "missionsViewCell", for: indexPath) as! MissionTableViewCell
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
