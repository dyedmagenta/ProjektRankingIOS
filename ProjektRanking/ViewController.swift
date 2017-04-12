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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentCell", for: indexPath) as! RecentGameCell
        
        cell.labelPlayer.text = "Player1 vs Player2"
        cell.labelTournament.text = "Tournament1"
        cell.labelDate.text = "29.03.2017"
        
        return cell
    }
    
}

