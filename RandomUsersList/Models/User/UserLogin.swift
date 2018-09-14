//
//  UserLogin.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 14/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation

struct UserLogin: Decodable {
	let username: String
	let password: String
	let salt: String
	let md5: String
	let sha1: String
	let sha256: String
}
