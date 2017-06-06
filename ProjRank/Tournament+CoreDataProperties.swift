//
//  Tournament+CoreDataProperties.swift
//  ProjRank
//
//  Created by MAC-10 on 06.06.2017.
//  Copyright © 2017 Frankiewicz. All rights reserved.
//

import Foundation
import CoreData


extension Tournament {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tournament> {
        return NSFetchRequest<Tournament>(entityName: "Tournament");
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?

}
