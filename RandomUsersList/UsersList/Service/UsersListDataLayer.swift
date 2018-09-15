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
	func saveUsers(_ users: [User],
				   startingIdentifier: Double)
}

struct UsersListDataLayer {
	let context: NSManagedObjectContext
}

extension UsersListDataLayer: IUsersListDataLayer {
	func retrieveUsers(forPage index: Int,
					   countPerPage: Int) -> [User] {
		do {
			let request: NSFetchRequest<UserModel> = UserModel.fetchRequest()
			request.sortDescriptors = [NSSortDescriptor(key: "identifier", ascending: true)]
			let users = try context.fetch(request)
			
			guard !users.isEmpty else {
				return []
			}
			
			let maxIndex = min((index * countPerPage), users.count)
			let pageUsers = users[((index - 1) * countPerPage)..<maxIndex]
			
			return pageUsers.map({ $0.toUser() })
		} catch {
			print(error)
			return []
		}
	}
	
	func saveUsers(_ users: [User],
				   startingIdentifier: Double) {
		var identifier = startingIdentifier
		for user in users {
			let userModel = UserModel(fromUser: user,
									  in: context)
			userModel.identifier = identifier
			identifier += 1
		}
		
		do {
			try context.save()
		} catch {
			print("Failed saving Users in context")
			print(error)
		}
	}
}
