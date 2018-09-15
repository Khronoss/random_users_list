//
//  UserLoginModel+CoreDataProperties.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 15/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//
//

import Foundation
import CoreData


extension UserLoginModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserLoginModel> {
        return NSFetchRequest<UserLoginModel>(entityName: "UserLoginModel")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var salt: String?
    @NSManaged public var md5: String?
    @NSManaged public var sha1: String?
    @NSManaged public var sha256: String?
    @NSManaged public var user: UserModel?

}
