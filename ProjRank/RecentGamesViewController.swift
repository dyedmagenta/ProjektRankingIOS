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
    
    @IBOutlet weak var recentGamesTable: UITableView!
    
    @IBAction func refreshData(_ sender: Any) {
            handler.refreshAllData()
        self.recentGamesTable.reloadData()
    }
    
    var games = [Game]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        recentGamesTable.delegate = self
        recentGamesTable.dataSource = self
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext

        
        let gamesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")
        do {
            games = try managedContext.fetch(gamesFetch) as! [Game]
        }
        catch {
            fatalError("Failed to fetch games: \(error)")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}

extension RecentGamesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if(indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! ProfileCell
            
            cell.player1Label.text = "White Player"
            cell.player1ScoreLabel.text = ""
            cell.player2Label.text = "Black Player"
            cell.player2ScoreLabel.text = ""
            cell.dateLabel.text = "Date"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecentCell", for: indexPath) as! ProfileCell
            print(games[indexPath.row])
            cell.player1Label.text = games[indexPath.row].whitePlayer?.name
            cell.player1ScoreLabel.text = games[indexPath.row].whiteScoreChange
            cell.player2Label.text = games[indexPath.row].blackPlayer?.name
            cell.player2ScoreLabel.text = games[indexPath.row].blackScoreChange
            cell.dateLabel.text = games[indexPath.row].date
            
            return cell
        }
    }
}

