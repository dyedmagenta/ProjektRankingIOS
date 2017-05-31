//
//  ProfileViewController.swift
//  ProjektRanking
//
//  Created by MAC-06 on 26.04.2017.
//  Copyright © 2017 PitPit. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if(indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! RecentGameCell
            cell.labelPlayer1.text = "Player 1"
            cell.labelPlayer2.text = "Player 2"
            cell.labelDate.text = "Date"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecentCell", for: indexPath) as! RecentGameCell
            
            cell.labelPlayer1.text = "Player " + String(arc4random_uniform(10))
            cell.labelPlayerChange1.text = "(+ " + String(arc4random_uniform(10)) + ")"
            cell.labelPlayer2.text = "Player " + String(arc4random_uniform(10))
            cell.labelPlayerChange2.text = "(- " + String(arc4random_uniform(10)) + ")"
            cell.labelDate.text = "Date"
            
            
            
            
            cell.labelDate.text = String(arc4random_uniform(50))
            
            return cell
        }
    }
    
}
