//
//  RankingViewController.swift
//  ProjektRanking
//
//  Created by MAC-06 on 12.04.2017.
//  Copyright © 2017 PitPit. All rights reserved.
//

import UIKit

class RankingViewController: UIViewController {

    @IBOutlet weak var RankingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        RankingTableView.dataSource = self
        RankingTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RankingViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 51
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if(indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RankingHeaders", for: indexPath) as! RankingHeadersCell
            cell.playersLabel.text = "Player"
            cell.dateLabel.text = "Date"
            cell.scoreLabel.text = "Score"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RankingCell", for: indexPath) as! RankingHeadersCell
            
            cell.playersLabel.text = "Player A vs Player B" + String(arc4random_uniform(1000))
            
            cell.dateLabel.text = String(arc4random_uniform(50))
            cell.scoreLabel.text = String (arc4random_uniform(2)) + " : " + String (arc4random_uniform(2))
            
            return cell
        }
    }

    
    
}
