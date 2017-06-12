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
    
    static func game(withDictionary dict:[String:String], inContext context: NSManagedObjectContext) -> Game{
        
        let entityName = String(describing: Game.self)
        let game = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! Game
        
        game.remoteId = dict["id"]
        game.blackPlayerId = dict["blackPlayerId"]
        game.whitePlayerId = dict["whitePlayerId"]
        game.blackScoreChange = dict["blackScoreChange"]
        game.whiteScoreChange = dict["whiteScoreChange"]
        game.tournamentId = dict["tournamentId"]
        game.date = dict["data"]
        
        let whitePlayerFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        whitePlayerFetch.predicate = NSPredicate(format: "remoteId == %@", dict["whitePlayerId"]!)
        do {
            let fetchedPlayer = try context.fetch(whitePlayerFetch) as! [Player]
            fetchedPlayer[0].addToGamesAsWhite(game)
            game.whitePlayer = fetchedPlayer[0]
        }
        catch {
            fatalError("Failed to fetch white player: \(error)")
        }
        
        let blackPlayerFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        blackPlayerFetch.predicate = NSPredicate(format: "remoteId == %@", dict["blackPlayerId"]!)
        do {
            let fetchedPlayer = try context.fetch(blackPlayerFetch) as! [Player]
            fetchedPlayer[0].addToGamesAsBlack(game)
            game.blackPlayer = fetchedPlayer[0]
        }
        catch {
            fatalError("Failed to fetch black player: \(error)")
        }
        
        let tournamentFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Tournament")
        tournamentFetch.predicate = NSPredicate(format: "remoteId == %@", dict["blackPlayerId"]!)
        do {
            let fetchedTournament = try context.fetch(tournamentFetch) as! [Tournament]
            fetchedTournament[0].addToGames(game)
            game.tournament = fetchedTournament[0]
        }
        catch {
            fatalError("Failed to fetch tournament: \(error)")
        }

        
        return game
    }
    
}
