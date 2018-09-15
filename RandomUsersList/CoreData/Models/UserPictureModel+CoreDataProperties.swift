//
//  UserPictureModel+CoreDataProperties.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 15/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//
//

import Foundation
import CoreData


extension UserPictureModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserPictureModel> {
        return NSFetchRequest<UserPictureModel>(entityName: "UserPictureModel")
    }

    @NSManaged public var large: String?
    @NSManaged public var medium: String?
    @NSManaged public var thumbnail: String?
    @NSManaged public var user: UserModel?

}
