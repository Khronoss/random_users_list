//
//  UserLocation.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation

struct UserLocation: Decodable {
	let street: String
	let city: String
	let state: String
	let postCode: String
	
	private enum CodingKeys: String, CodingKey {
		case street
		case city
		case state
		case postCode = "postcode"
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		street = try container.decode(String.self, forKey: .street)
		city = try container.decode(String.self, forKey: .city)
		state = try container.decode(String.self, forKey: .state)

		if let postCodeInt = try? container.decode(Int.self, forKey: .postCode) {
			postCode = String(postCodeInt)
		} else {
			postCode = try container.decode(String.self, forKey: .postCode)
		}
	}
}
