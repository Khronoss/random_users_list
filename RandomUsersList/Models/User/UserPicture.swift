//
//  UserPicture.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation

struct UserPicture: Decodable {
	let large: URL
	let medium: URL
	let thumbnail: URL
}
