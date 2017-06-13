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
        
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            _ = try managedContext.execute(request)
            _ = try managedContext.save()
            
        } catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
        
        if let tab = json.array {
            for json in tab {
                
                let dict = json.dictionaryObject
                let player = Player.player(withDictionary: dict as! [String : Any]!, inContext: managedContext)
                do {
                    try managedContext.save()
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
            for json in tab {
                
                
                let dict = json.dictionaryObject
                let tournament = Tournament.tournament(withDictionary: dict as! [String : Any]!, inContext: managedContext)
                
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
                
                news.setValue("\(p["id"])", forKeyPath: "remoteId")
                news.setValue(p["content"].string, forKeyPath: "content")
                news.setValue(p["date"].string, forKeyPath: "date")
                
                do {
                    try managedContext.save()
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
            for json in tab {
                
                let dict = json.dictionaryObject
                let game = Game.game(withDictionary: dict as! [String : Any]!, inContext: managedContext)
                do {
                    try managedContext.save()
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
                
            }
        }
        
    }

    
}
