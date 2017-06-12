//
//  News+CoreDataProperties.swift
//  
//
//  Created by MAC-10 on 12.06.2017.
//
//

import Foundation
import CoreData


extension News {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<News> {
        return NSFetchRequest<News>(entityName: "News");
    }

    @NSManaged public var content: String?
    @NSManaged public var date: String?
    @NSManaged public var remoteId: String?

}
