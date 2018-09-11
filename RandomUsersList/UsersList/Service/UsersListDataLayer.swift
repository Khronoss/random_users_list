//
//  UsersListDataLayer.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation
import CoreData

protocol IUsersListDataLayer {
	func retrieveUsers(forPage index: Int,
					   countPerPage: Int) -> [User]
	func saveUsers(_ users: [User])
}

struct UsersListDataLayer {
	let context: NSManagedObjectContext
}

extension UsersListDataLayer: IUsersListDataLayer {
	func retrieveUsers(forPage index: Int,
					   countPerPage: Int) -> [User] {
		do {
			let users = try context.fetch(UserModel.fetchRequest()) as! [UserModel]
			let maxIndex = min(((index + 1) * countPerPage), users.count)
			let pageUsers = users[(index * countPerPage)..<maxIndex]
			
			return pageUsers.map({ $0.toUser() })
		} catch {
			print(error)
			return []
		}
	}
	
	func saveUsers(_ users: [User]) {
		let _ = users.map { (user) -> UserModel in
			let userModel = UserModel(fromUser: user,
									  in: context)
			
			return userModel
		}
	}
}
