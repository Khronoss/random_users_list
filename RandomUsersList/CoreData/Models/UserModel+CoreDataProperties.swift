//
//  UserModel+CoreDataProperties.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//
//

import Foundation
import CoreData


extension UserModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserModel> {
        return NSFetchRequest<UserModel>(entityName: "UserModel")
    }

    @NSManaged public var gender: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var nationality: String?
    @NSManaged public var name: UserNameModel?
    @NSManaged public var location: UserLocationModel?
    @NSManaged public var picture: UserPictureModel?

}
