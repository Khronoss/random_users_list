//
//  User.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation

struct User: Decodable {
	enum Gender: String, Decodable {
		case male
		case female
	}
	
	let gender: Gender
	let name: UserName
	let location: UserLocation
	let email: String
	let phone: String
	let picture: UserPicture
	let nationality: String
	
	private enum CodingKeys: String, CodingKey {
		case gender
		case name
		case location
		case email
		case phone
		case picture
		case nationality = "nat"
	}
}
