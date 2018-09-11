//
//  UserNameModel+CoreDataClass.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//
//

import Foundation
import CoreData

//@objc(UserNameModel)
public class UserNameModel: NSManagedObject {
	init(fromName name: UserName,
		 in context: NSManagedObjectContext) {
		super.init(entity: UserNameModel.entity(),
				   insertInto: context)
		
		title = name.title
		firstname = name.firstname
		lastname = name.lastname
	}
	
	func toUserName() -> UserName {
		let name = UserName(title: title!,
							firstname: firstname!,
							lastname: lastname!)
		
		return name
	}
}
