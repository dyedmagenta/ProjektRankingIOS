//
//  DataManager.swift
//  ProjRank
//
//  Created by Tenek on 08/06/2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import UIKit
import CoreData


class DataManager: NSObject {

    
    public func GetPlayers() -> Array<Any> {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return []
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        var players: [Player] = []
        
        do {
            players = try managedContext.fetch(Player.fetchRequest())
            
            var result = [ [:] ]
            
            for player in players {
            result.append( ["id": player.remoteId ?? "", "rank": player.rank ?? "", "name": player.name ?? "", "score": player.score ?? "", "playingSince": player.playingSince ?? ""] )
            }
            if(result[0].isEmpty){
                result.remove(at: 0)
            }
            return result
        } catch {
            print("Fetching Failed")
            return []
        }
    }
    
    public func GetNews() -> Array<Any> {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return []
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        var newsItems: [News] = []
        
        do {
            newsItems = try managedContext.fetch(News.fetchRequest())
            
            var result = [ [:] ]
            
            for news in newsItems {
                result.append( ["content": news.content ?? "", "date": news.date ?? ""] )
            }
            if(result[0].isEmpty){
                result.remove(at: 0)
            }
            return result
        } catch {
            print("Fetching Failed")
            return []
        }
    }
    
    public func GetTournaments() -> Array<Any> {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return []
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        var tournaments: [Tournament] = []
        
        do {
            tournaments = try managedContext.fetch(Tournament.fetchRequest())
            
            var result = [ [:] ]
            
            for tournament in tournaments {
                result.append( ["tournamentId": tournament.remoteId ?? "", "name": tournament.name ?? ""] )
            }
            if(result[0].isEmpty){
                result.remove(at: 0)
            }
            return result
        } catch {
            print("Fetching Failed")
            return []
        }
    }

    public func GetGames() -> Array<Any> {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return []
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        var games: [Game] = []
        
        do {
            games = try managedContext.fetch(Game.fetchRequest())
            
            var result = [ [:] ]
            var players: Array = self.GetPlayers()
            var tournaments: Array = self.GetTournaments()
            
            for game in games {
                
                let playerW = players.filter({
                    ((game.whitePlayerId == (($0 as! [String:Any])["id"] as! String))) })[0]
                let playerB = players.filter({
                    ((game.blackPlayerId == (($0 as! [String:Any])["id"] as! String))) })[0]
               
                result.append( [ "whitePlayerName": (playerW as! [String:Any])["name"], "blackPlayerName": (playerB as! [String:Any])["name"], "whiteScoreChange":game.whiteScoreChange , "blackScoreChange":game.blackScoreChange,  "date":game.date, "id":game.remoteId ])
                    //, "whiteScoreChange":game.whiteScoreChange, "blackPlayerName":playerB["name"], "blackScoreChange":game.blackScoreChange, "date":game.date , "id":game.id ] )
            }
            if(result[0].isEmpty){
                result.remove(at: 0)
            }
            return result
        } catch {
            print("Fetching Failed")
            return []
        }
    }
    
}
