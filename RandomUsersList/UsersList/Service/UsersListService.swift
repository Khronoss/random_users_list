//
//  UsersListService.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation

protocol IUsersListService {
	func getUsersList(forPage index: Int,
					  countPerPage: Int,
					  completion: @escaping ([User]?, Error?) -> Void)
}

struct UsersListService {
	let networkLayer: IUsersListNetworkLayer
	let dataLayer: IUsersListDataLayer
}

extension UsersListService: IUsersListService {
	func getUsersList(forPage index: Int,
					  countPerPage: Int,
					  completion: @escaping ([User]?, Error?) -> Void) {
		networkLayer.loadUsersList(forPage: index) { (usersListEnveloppe, error) in
			guard let enveloppe = usersListEnveloppe else {
				let users = self.dataLayer.retrieveUsers(forPage: index,
														 countPerPage: countPerPage)
				if users.isEmpty {
					completion(nil, error)
				} else {
					completion(users, nil)
				}
				return
			}
			let users = enveloppe.results

			self.dataLayer.saveUsers(users, startingIdentifier: Double(index * countPerPage))
			completion(users, error)
		}
	}
}
