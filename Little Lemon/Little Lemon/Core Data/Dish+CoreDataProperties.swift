//
//  Dish+CoreDataProperties.swift
//  Little Lemon
//
//  Created by Sameer Ghauri on 23/09/2023.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var title: String?
    @NSManaged public var descriptionText: String?
    @NSManaged public var category: String?

}

extension Dish : Identifiable {

}
