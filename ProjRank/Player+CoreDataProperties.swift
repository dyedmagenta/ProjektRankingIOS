//
//  Player+CoreDataProperties.swift
//  ProjRank
//
//  Created by MAC-10 on 06.06.2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player");
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var playingSince: String?
    @NSManaged public var rank: String?
    @NSManaged public var score: String?

}
