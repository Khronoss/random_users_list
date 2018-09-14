//
//  UserLoginModel+CoreDataClass.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 14/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//
//

import Foundation
import CoreData

//@objc(UserLoginModel)
public class UserLoginModel: NSManagedObject {
	init(fromLogin login: UserLogin,
		 in context: NSManagedObjectContext) {
		let entity = NSEntityDescription.entity(forEntityName: "UserLoginModel", in: context)
		super.init(entity: entity!,
				   insertInto: context)
		
		username = login.username
		password = login.password
		salt = login.salt
		md5 = login.md5
		sha1 = login.sha1
		sha256 = login.sha256
	}
	
	public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
		super.init(entity: entity, insertInto: context)
	}

	func toLogin() -> UserLogin {
		let login = UserLogin(username: username!,
							  password: password!,
							  salt: salt!,
							  md5: md5!,
							  sha1: sha1!,
							  sha256: sha256!)
		return login
	}
}
