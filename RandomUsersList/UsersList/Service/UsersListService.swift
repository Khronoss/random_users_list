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
					  completion: @escaping ([User]?, Error?) -> Void)
}

struct UsersListService {
	let networkLayer: IUsersListNetworkLayer
}

extension UsersListService: IUsersListService {
	func getUsersList(forPage index: Int,
					  completion: @escaping ([User]?, Error?) -> Void) {
		networkLayer.loadUsersList(forPage: index) { (usersListEnveloppe, error) in
			completion(usersListEnveloppe?.results, error)
		}
	}
}
