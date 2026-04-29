//
//  ContactEntity+CoreDataProperties.swift
//  RetoTC2007B
//

import Foundation
import CoreData

extension ContactEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactEntity> {
        return NSFetchRequest<ContactEntity>(entityName: "ContactEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var phone: String?
    @NSManaged public var role: String?
    
    var firstName_wrapped: String{
        firstName ?? ""
    }
    
    var lastName_wrapped: String{
        lastName ?? ""
    }
    
    var phone_wrapped: String{
        phone ?? ""
    }
    
    var role_wrapped: String{
        role ?? ""
    }
}

extension ContactEntity : Identifiable {

}
