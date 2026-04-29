//
//  ImageEntity+CoreDataProperties.swift
//  RetoTC2007B
//

import Foundation
import CoreData
import SwiftUI


extension ImageEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageEntity> {
        return NSFetchRequest<ImageEntity>(entityName: "ImageEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var imageD: Data?
    @NSManaged public var name: String?
    
//    var image_wrapped: Data {
//        image ?? data
//    }

}

extension ImageEntity : Identifiable {

}
