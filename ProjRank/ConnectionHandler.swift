//
//  ConnectionHandler.swift
//  ProjRank
//
//  Created by MAC-10 on 06.06.2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreData


class ConnectionHandler: NSObject {
    
    var connectionString: String = "http://52.58.170.113:5000/api/"
    var tables = ["player", "news", "tournament", "game"]
    
    var isRefreshing: Bool = false;
    
    
    
    func refreshAllData ()  {
        
        for table in tables {
        isRefreshing = true;
            
            Alamofire.request(connectionString + table).responseJSON { (responseData) -> Void in
                if((responseData.result.value) != nil) {
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    
                    if table == self.tables[0] {
                        self.insertPlayer(json: swiftyJsonVar)
                    }
                    if table == self.tables[1] {
                        self.insertNews(json: swiftyJsonVar)
                    }
                    if table == self.tables[2] {
                        self.insertTournament(json: swiftyJsonVar)
                    }
                    if table == self.tables[3] {
                        self.insertGame(json: swiftyJsonVar)
                    }
                    
                    self.isRefreshing = false;
                }
            }
            
        }
        
        
    }
    
    func insertPlayer(json: JSON){
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        
        let entityPlayer =
            NSEntityDescription.entity(forEntityName: "Player",
                                       in: managedContext)!
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            _ = try managedContext.execute(request)
            _ = try managedContext.save()
            
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
        
        if let tab = json.array {
            for p in tab {
                let player = NSManagedObject(entity: entityPlayer,
                                             insertInto: managedContext)
                
                player.setValue("\(p["id"])", forKeyPath: "id")
                player.setValue(p["name"].string, forKeyPath: "name")
                player.setValue("\(p["rank"])", forKeyPath: "rank")
                player.setValue("\(p["score"])", forKeyPath: "score")
                player.setValue(p["playingSince"].string, forKeyPath: "playingSince")
                do {
                    try managedContext.save()
                    //print(player)
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
                
            }
        }

    }
    func insertTournament(json: JSON){
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let entityTournament =
            NSEntityDescription.entity(forEntityName: "Tournament",
                                       in: managedContext)!
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Tournament")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            _ = try managedContext.execute(request)
            _ = try managedContext.save()
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
        
        if let tab = json.array {
            for p in tab {
                let tournament = NSManagedObject(entity: entityTournament,
                                             insertInto: managedContext)
                
                tournament.setValue("\(p["id"])", forKeyPath: "id")
                tournament.setValue(p["name"].string, forKeyPath: "name")
                
                do {
                    try managedContext.save()
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
                
            }
        }
        
    }
    
    func insertNews(json: JSON){
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        
        let entityNews =
            NSEntityDescription.entity(forEntityName: "News",
                                       in: managedContext)!
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "News")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            _ = try managedContext.execute(request)
            _ = try managedContext.save()
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
        
        if let tab = json.array {
            for p in tab {
                let news = NSManagedObject(entity: entityNews,
                                                 insertInto: managedContext)
                
                news.setValue("\(p["id"])", forKeyPath: "id")
                news.setValue(p["content"].string, forKeyPath: "content")
                news.setValue(p["date"].string, forKeyPath: "date")
                
                do {
                    try managedContext.save()
                    print(news)
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
                
            }
        }
        
    }
    
    func insertGame(json: JSON){
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        
        let entityGame =
            NSEntityDescription.entity(forEntityName: "Game",
                                       in: managedContext)!
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Game")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            _ = try managedContext.execute(request)
            _ = try managedContext.save()
            
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
        
        if let tab = json.array {
            for p in tab {
                let game = NSManagedObject(entity: entityGame,
                                             insertInto: managedContext)
                
                game.setValue("\(p["id"])", forKeyPath: "id")
                game.setValue("\(p["whitePlayerId"])", forKeyPath: "whitePlayerId")
                game.setValue("\(p["blackPlayerId"])", forKeyPath: "blackPlayerId")
                game.setValue("\(p["tournamentId"])", forKeyPath: "tournamentId")
                game.setValue("\(p["whiteScoreChange"])", forKeyPath: "whiteScoreChange")
                game.setValue("\(p["blackScoreChange"])", forKeyPath: "blackScoreChange")
                game.setValue(p["date"].string, forKeyPath: "date")
                
                do {
                    try managedContext.save()
                    print(game)
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
                
            }
        }
        
    }

    
}
