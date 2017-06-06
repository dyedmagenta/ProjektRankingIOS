//
//  Game+CoreDataProperties.swift
//  ProjRank
//
//  Created by MAC-10 on 06.06.2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import Foundation
import CoreData


extension Game {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Game> {
        return NSFetchRequest<Game>(entityName: "Game");
    }

    @NSManaged public var blackPlayerId: String?
    @NSManaged public var blackScoreChange: String?
    @NSManaged public var date: String?
    @NSManaged public var id: String?
    @NSManaged public var tournamentId: String?
    @NSManaged public var whitePlayerId: String?
    @NSManaged public var whiteScoreChange: String?

}
