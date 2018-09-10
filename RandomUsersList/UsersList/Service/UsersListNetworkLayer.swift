//
//  UsersListNetworkLayer.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation
import Alamofire

protocol IUsersListNetworkLayer {
	func loadUsersList(forPage index: Int,
					   completion: @escaping (PaginatedEnveloppe<[User]>?, Error?) -> Void)
}

struct UsersListNetworkLayer {}

extension UsersListNetworkLayer: IUsersListNetworkLayer {
	func loadUsersList(forPage index: Int,
					   completion: @escaping (PaginatedEnveloppe<[User]>?, Error?) -> Void) {
		Alamofire.request("https://randomuser.me/api/1.0/?seed=lydia&results=10&page=\(index)")
			.responseJSON { (response) in
				guard let data = response.data else {
					return completion(nil, response.error)
				}
				
				do {
					let decoder = JSONDecoder()
					let result = try decoder.decode(PaginatedEnveloppe<[User]>.self, from: data)
					
					completion(result, nil)
				} catch {
					completion(nil, error)
				}
		}
	}
}
