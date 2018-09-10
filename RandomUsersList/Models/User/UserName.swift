//
//  UserName.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation

struct UserName: Decodable {
	let title: String
	let firstname: String
	let lastname: String
	
	private enum CodingKeys: String, CodingKey {
		case title
		case firstname = "first"
		case lastname = "last"
	}
	
	func fullName(withTitle: Bool) -> String {
		var fullName = "\(firstname.capitalized) \(lastname.uppercased())"

		if withTitle {
			fullName = "\(title.capitalized) " + fullName
		}
		
		return fullName
	}
}
