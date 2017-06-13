//
//  RankingViewController.swift
//  ProjRank
//
//  Created by MAC-10 on 31.05.2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import UIKit
import CoreData

class RankingViewController: UIViewController {

    @IBAction func refreshButtonAction(_ sender: Any) {
        
        handler.refreshAllData()
        loadData()
        tableView.reloadData()
        
    }
    @IBOutlet weak var tableView: UITableView!
    
    var handler: ConnectionHandler = ConnectionHandler()
    var players: [Player] = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    
    
    
    func loadData(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let playersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        do {
            players = try managedContext.fetch(playersFetch) as! [Player]
        }
        catch {
            fatalError("Failed to fetch games: \(error)")
        }
    }


   
}
extension RankingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if(indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RankingHeader", for: indexPath) as! RankingCell
            
            cell.rankLabel.text = "Rank"
            cell.playerNameLabel.text = "Player"
            cell.scoreLabel.text = "Score"
            
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RankingCell", for: indexPath) as! RankingCell
            
            cell.rankLabel.text = players[indexPath.row - 1].rank
            cell.playerNameLabel.text = players[indexPath.row - 1].name
            cell.scoreLabel.text = players[indexPath.row - 1].score
            
            return cell
        }
    }
}
