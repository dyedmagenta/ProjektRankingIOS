//
//  RecentGamesViewController.swift
//  ProjRank
//
//  Created by MAC-10 on 31.05.2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

class RecentGamesViewController: UIViewController {

    var handler: ConnectionHandler = ConnectionHandler()
    var dataManager: DataManager = DataManager()
    
    
    private let persistentContainer = NSPersistentContainer(name: "Game")
 
    
    @IBOutlet weak var recentGamesTable: UITableView!
    
    @IBAction func refreshData(_ sender: Any) {
            handler.refreshAllData()
            print(dataManager.GetGames())
    }
    
    var games = [(whiteName: String, whiteScore: String, blackName: String, blackScore: String, date: String)]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}

extension RecentGamesViewController: UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if(indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecentHeaderCell", for: indexPath) as! ProfileCell
            
            cell.player1Label.text = "White Player"
            cell.player1ScoreLabel.text = ""
            cell.player2Label.text = "Black Player"
            cell.player2ScoreLabel.text = ""
            cell.dateLabel.text = "Date"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecentCell", for: indexPath) as! ProfileCell
            
            let game = games[indexPath.row]
            cell.player1Label.text = game.whiteName
            cell.player1ScoreLabel.text = game.whiteScore
            cell.player2Label.text = game.blackName
            cell.player2ScoreLabel.text = game.blackScore
            cell.dateLabel.text = game.date
            
            return cell
        }
    }
}

