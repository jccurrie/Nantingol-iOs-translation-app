//
//  FavoriteEntity+CoreDataProperties.swift
//  Nantingol
//
//  Created by Julian Currie on 4/6/22.
//

import Foundation
import CoreData

extension FavoriteEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteEntity> {
        return NSFetchRequest<FavoriteEntity>(entityName: "FavoriteEntity")
    }
    @NSManaged public var originalText: String?
    @NSManaged public var translatedText: String?
}

extension FavoriteEntity : Identifiable {
}
