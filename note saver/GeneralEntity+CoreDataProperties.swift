//
//  GeneralEntity+CoreDataProperties.swift
//  note saver
//
//  Created by aidin on 8/1/18.
//  Copyright © 2018 aidin. All rights reserved.
//
//

import Foundation
import CoreData


extension GeneralEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeneralEntity> {
        return NSFetchRequest<GeneralEntity>(entityName: "GeneralEntity")
    }

    @NSManaged public var age: String
    @NSManaged public var longDes: String
    @NSManaged public var name: String
    @NSManaged public var shortDes: String

}
