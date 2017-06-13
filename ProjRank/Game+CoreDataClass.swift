//
//  Game+CoreDataClass.swift
//  ProjRank
//
//  Created by MAC-10 on 12.06.2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import Foundation
import CoreData


public class Game: NSManagedObject {
    
    static func game(withDictionary dict:[String:Any], inContext context: NSManagedObjectContext) -> Game{
        
        let entityName = String(describing: Game.self)
        let game = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! Game
        
        game.remoteId = String( describing: dict["id"] as! NSNumber)
        game.blackPlayerId = String( describing: dict["blackPlayerId"] as! NSNumber)
        game.whitePlayerId = String( describing: dict["whitePlayerId"] as! NSNumber)
        game.blackScoreChange = String( describing: dict["blackScoreChange"] as! NSNumber)
        game.whiteScoreChange = String( describing: dict["whiteScoreChange"] as! NSNumber)
        game.date = String (describing: dict["date"] as! String)
        
        let whitePlayerFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        whitePlayerFetch.predicate = NSPredicate(format: "remoteId == %@", game.whitePlayerId!)
        do {
            let fetchedPlayer = try context.fetch(whitePlayerFetch) as! [Player]
            fetchedPlayer[0].addToGamesAsWhite(game)
            game.whitePlayer = fetchedPlayer[0]
        }
        catch {
            fatalError("Failed to fetch white player: \(error)")
        }
        
        let blackPlayerFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        blackPlayerFetch.predicate = NSPredicate(format: "remoteId == %@", game.blackPlayerId!)
        do {
            let fetchedPlayer = try context.fetch(blackPlayerFetch) as! [Player]
            fetchedPlayer[0].addToGamesAsBlack(game)
            game.blackPlayer = fetchedPlayer[0]
        }
        catch {
            fatalError("Failed to fetch black player: \(error)")
        }
        
        return game
    }
    
}
