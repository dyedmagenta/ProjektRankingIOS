//
//  Player+CoreDataClass.swift
//  ProjRank
//
//  Created by MAC-10 on 12.06.2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import Foundation
import CoreData


public class Player: NSManagedObject {

    
    
    static func player(withDictionary dict:[String:String], inContext context: NSManagedObjectContext) -> Player{
        
        let entityName = String(describing: Player.self)
        let player = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! Player
        
        player.remoteId = dict["id"]
        player.name = dict["name"]
        player.rank = dict["rank"]
        player.playingSince = dict["playingSince"]
        player.score = dict["score"]
        
        return player
    }
}
