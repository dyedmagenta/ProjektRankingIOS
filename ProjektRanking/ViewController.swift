//
//  ViewController.swift
//  ProjektRanking
//
//  Created by MAC-10 on 29.03.2017.
//  Copyright © 2017 PitPit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if(indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! CustomHeaderCell
            cell.labelPlayer.text = "Players"
            cell.labelTournament.text = "Tournament"
            cell.labelDate.text = "Date"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecentCell", for: indexPath) as! RecentGameCell
            
            cell.labelPlayer.text = "Player A vs Player B" + String(arc4random_uniform(1000))
            cell.labelTournament.text = "Tournament abc" + String (arc4random_uniform(100))
            cell.labelDate.text = String(arc4random_uniform(50))
            
            return cell
        }
    }
    
}

