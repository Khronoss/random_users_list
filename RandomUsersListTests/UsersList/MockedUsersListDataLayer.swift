//
//  MockedUsersListDataLayer.swift
//  RandomUsersListTests
//
//  Created by Anthony Merle on 13/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

@testable import RandomUsersList

import Foundation

class MockedUsersListDataLayer {
	var users: [User]
	
	var retrieveUsersCalled = false
	var saveUsersCalled = false

	init() {
		users = []
	}
}

extension MockedUsersListDataLayer: IUsersListDataLayer {
	func retrieveUsers(forPage index: Int,
					   countPerPage: Int) -> [User] {
		retrieveUsersCalled = true

		guard users.count >= countPerPage else {
			return []
		}
		
		let pagedUsers = users[0..<countPerPage]
		
		return Array(pagedUsers)
	}
	
	func saveUsers(_ users: [User],
				   startingIdentifier: Double) {
		saveUsersCalled = true
	}
}
