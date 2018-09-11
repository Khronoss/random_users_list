//
//  UserLocationModel+CoreDataProperties.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//
//

import Foundation
import CoreData


extension UserLocationModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserLocationModel> {
        return NSFetchRequest<UserLocationModel>(entityName: "UserLocationModel")
    }

    @NSManaged public var street: String?
    @NSManaged public var city: String?
    @NSManaged public var state: String?
    @NSManaged public var postCode: String?
    @NSManaged public var user: UserModel?

}
