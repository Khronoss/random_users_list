//
//  UserNameModel+CoreDataProperties.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 15/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//
//

import Foundation
import CoreData


extension UserNameModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserNameModel> {
        return NSFetchRequest<UserNameModel>(entityName: "UserNameModel")
    }

    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var title: String?
    @NSManaged public var user: UserModel?

}
