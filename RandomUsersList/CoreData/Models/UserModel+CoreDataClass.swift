//
//  UserModel+CoreDataClass.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//
//

import Foundation
import CoreData

//@objc(UserModel)
public class UserModel: NSManagedObject {
	init(fromUser user: User,
		 in context: NSManagedObjectContext) {
		let entity = NSEntityDescription.entity(forEntityName: "UserModel", in: context)
		super.init(entity: entity!,
				   insertInto: context)
		
		email = user.email
		gender = user.gender.rawValue
		nationality = user.nationality
		phone = user.phone
		
		name = UserNameModel(fromName: user.name,
							 in: context)
		name?.user = self
		
		location = UserLocationModel(fromLocation: user.location,
									 in: context)
		location?.user = self
		
		picture = UserPictureModel(fromPicture: user.picture,
								   in: context)
		picture?.user = self
	}
	
	public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
		super.init(entity: entity, insertInto: context)
	}
	
	func toUser() -> User {
		let user = User(gender: User.Gender(rawValue: gender!)!,
						name: name!.toUserName(),
						location: location!.toUserLocation(),
						email: email!,
						phone: phone!,
						picture: picture!.toUserPicture(),
						nationality: nationality!)
		
		return user
	}
}
