//
//  MockedUsersListNetworkLayer.swift
//  RandomUsersListTests
//
//  Created by Anthony Merle on 13/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

@testable import RandomUsersList

import Foundation

class MockedUsersListNetworkLayer {
	var users: [User]
	let countPerPage: Int
	var loadUsersListCalled = false
	
	static let forceErrorIndex = 999
	
	init() {
		users = []
		countPerPage = 10
	}
}

extension MockedUsersListNetworkLayer: IUsersListNetworkLayer {
	func loadUsersList(forPage index: Int,
					   completion: @escaping (PaginatedEnveloppe<[User]>?, Error?) -> Void) {
		loadUsersListCalled = true

		guard index != MockedUsersListNetworkLayer.forceErrorIndex else {
			let error = NSError(domain: "MockedUsersListNetworkLayer",
								code: index,
								userInfo: nil)
			return completion(nil, error)
		}
		
		let pageInfo = PaginatedEnveloppeInformation(seed: "seed",
													 results: countPerPage,
													 page: index)
		let startIndex = index * countPerPage
		let endIndex = (index + 1) * countPerPage
		let enveloppe = PaginatedEnveloppe<[User]>(info: pageInfo,
												   results: Array(users[startIndex..<endIndex]))

		completion(enveloppe, nil)
	}
}
