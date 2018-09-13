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
		let entity = NSEntityDescription.entity(forEntityName: "UserNameModel", in: context)
		super.init(entity: entity!,
				   insertInto: context)
		
		title = name.title
		firstname = name.firstname
		lastname = name.lastname
	}

	public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
		super.init(entity: entity, insertInto: context)
	}

	func toUserName() -> UserName {
		let name = UserName(title: title!,
							firstname: firstname!,
							lastname: lastname!)
		
		return name
	}
}
