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
    var context: NSManagedObjectContext = NSManagedObjectContext()
    @IBOutlet weak var recentGamesTable: UITableView!
    @IBOutlet weak var newsLabel: UITextView!
    @IBAction func refreshData(_ sender: Any) {
        
        handler.refreshAllData()
        loadModel()
        self.recentGamesTable.reloadData()
    }
    
    var games = [Game]()
    var news = [News]()
    
    func loadModel(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        context = managedContext
        let gamesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")
        do {
            games = try managedContext.fetch(gamesFetch) as! [Game]
        }
        catch {
            fatalError("Failed to fetch games: \(error)")
        }
        
        let newsFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "News")
        do {
            news = try managedContext.fetch(newsFetch) as! [News]
        }
        catch {
            fatalError("Failed to fetch games: \(error)")
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadModel()
        recentGamesTable.delegate = self
        recentGamesTable.dataSource = self
        
        if(games.count == 0){
            handler.refreshAllData()
        }
        
        var newsText: String = ""
        for new in news {
            newsText = newsText + new.content! + "\n\n"
        }
        newsLabel.text = newsText
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
        return games.count + 1
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
            
            let game = games[indexPath.row - 1]

            
            cell.player1Label.text = game.whitePlayer!.name
            cell.player1ScoreLabel.text = " (" + game.whiteScoreChange! + ")"
            cell.player2Label.text = game.blackPlayer!.name
            cell.player2ScoreLabel.text = " (" + game.blackScoreChange! + ")"
            cell.dateLabel.text = game.date
            
            return cell
        }
    }
}

