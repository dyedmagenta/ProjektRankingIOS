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

    
    
    static func player(withDictionary dict:[String:Any], inContext context: NSManagedObjectContext) -> Player{
        
        let entityName = String(describing: Player.self)
        let player = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! Player
        
        player.remoteId = String( describing: dict["id"] as! NSNumber)
        player.name = dict["name"] as? String
        player.rank = String( describing: dict["rank"] as! NSNumber)
        player.playingSince = dict["playingSince"] as? String
        player.score = String( describing: dict["score"] as! NSNumber)
        
        return player
    }
}
