//
//  Game+CoreDataProperties.swift
//  ProjRank
//
//  Created by MAC-10 on 12.06.2017.
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
    @NSManaged public var remoteId: String?
    @NSManaged public var tournamentId: String?
    @NSManaged public var whitePlayerId: String?
    @NSManaged public var whiteScoreChange: String?
    @NSManaged public var whitePlayer: Player?
    @NSManaged public var blackPlayer: Player?
    @NSManaged public var tournament: Tournament?

}
