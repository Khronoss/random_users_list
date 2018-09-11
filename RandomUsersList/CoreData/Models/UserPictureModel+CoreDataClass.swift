//
//  UserPictureModel+CoreDataClass.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//
//

import Foundation
import CoreData

//@objc(UserPictureModel)
public class UserPictureModel: NSManagedObject {
	init(fromPicture picture: UserPicture,
		 in context: NSManagedObjectContext) {
		super.init(entity: UserPictureModel.entity(),
				   insertInto: context)
		
		large = picture.large.absoluteString
		medium = picture.medium.absoluteString
		thumbnail = picture.thumbnail.absoluteString
	}
	
	func toUserPicture() -> UserPicture {
		let picture = UserPicture(large: URL(string: large!)!,
								  medium: URL(string: medium!)!,
								  thumbnail: URL(string: thumbnail!)!)
		
		return picture
	}
}
