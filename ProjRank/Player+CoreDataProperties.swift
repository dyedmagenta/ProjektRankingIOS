//
//  Player+CoreDataProperties.swift
//  ProjRank
//
//  Created by MAC-10 on 12.06.2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import Foundation
import CoreData


extension Player {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Player> {
        return NSFetchRequest<Player>(entityName: "Player");
    }

    @NSManaged public var remoteId: String?
    @NSManaged public var name: String?
    @NSManaged public var playingSince: String?
    @NSManaged public var rank: String?
    @NSManaged public var score: String?
    @NSManaged public var gamesAsWhite: NSSet?
    @NSManaged public var gamesAsBlack: NSSet?

}

// MARK: Generated accessors for gamesAsWhite
extension Player {

    @objc(addGamesAsWhiteObject:)
    @NSManaged public func addToGamesAsWhite(_ value: Game)

    @objc(removeGamesAsWhiteObject:)
    @NSManaged public func removeFromGamesAsWhite(_ value: Game)

    @objc(addGamesAsWhite:)
    @NSManaged public func addToGamesAsWhite(_ values: NSSet)

    @objc(removeGamesAsWhite:)
    @NSManaged public func removeFromGamesAsWhite(_ values: NSSet)

}

// MARK: Generated accessors for gamesAsBlack
extension Player {

    @objc(addGamesAsBlackObject:)
    @NSManaged public func addToGamesAsBlack(_ value: Game)

    @objc(removeGamesAsBlackObject:)
    @NSManaged public func removeFromGamesAsBlack(_ value: Game)

    @objc(addGamesAsBlack:)
    @NSManaged public func addToGamesAsBlack(_ values: NSSet)

    @objc(removeGamesAsBlack:)
    @NSManaged public func removeFromGamesAsBlack(_ values: NSSet)

}
