//
//  User+Helpers.swift
//  RandomUsersListTests
//
//  Created by Anthony Merle on 13/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

@testable import RandomUsersList

import Foundation

extension User {
	static func createRandomUser(firstname: String,
								 lastname: String) -> User {
		let user = User(gender: .male,
						name: UserName(title: "Mr.",
									   firstname: firstname,
									   lastname: lastname),
						location: UserLocation(street: "street",
											   city: "city",
											   state: "state",
											   postCode: "1234"),
						email: "email@mail.com",
						login: UserLogin(username: "username",
										 password: "password",
										 salt: "salt",
										 md5: "md5",
										 sha1: "sha1",
										 sha256: "sha256"),
						phone: "555-1234-5678",
						picture: UserPicture(large: URL(string: "https://www.example.com")!,
											 medium: URL(string: "https://www.example.com")!,
											 thumbnail: URL(string: "https://www.example.com")!),
						nationality: "EN")
		
		return user
	}
}
