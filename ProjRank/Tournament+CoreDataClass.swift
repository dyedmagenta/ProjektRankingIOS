//
//  Tournament+CoreDataClass.swift
//  ProjRank
//
//  Created by MAC-10 on 12.06.2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import Foundation
import CoreData


public class Tournament: NSManagedObject {

    static func tournament(withDictionary dict:[String:Any], inContext context: NSManagedObjectContext) -> Tournament{
        
        let entityName = String(describing: Tournament.self)
        let tournament = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! Tournament
        
        tournament.remoteId = dict["id"] as? String
        tournament.name = dict["name"] as? String
        
        return tournament
    }
}
