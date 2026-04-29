//
//  ActionEntity+CoreDataProperties.swift
//  RetoTC2007B
//
//  Created by Edgar Alexandro on 19/10/22.
//

import Foundation
import CoreData

extension ActionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ActionEntity> {
        return NSFetchRequest<ActionEntity>(entityName: "ActionEntity")
    }

    @NSManaged public var id: UUID
    @NSManaged public var actionDescription: String?
    @NSManaged public var completed: Bool
    
    var actionDescription_wrapped: String{
        actionDescription ?? ""
    }
}

extension ActionEntity : Identifiable {

}
