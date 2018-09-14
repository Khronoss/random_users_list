//
//  LocalizableKey.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation

enum LocalizableKey {
	enum UserDetails {
		static let gender = "DETAILS.gender"
		static let phone = "DETAILS.phoneNumber"
		static let nationality = "DETAILS.nationality"

		static let sectionLocation = "DETAILS.sectionLocation"
		static let street = "DETIALS.street"
		static let city = "DETIALS.city"
		static let state = "DETIALS.state"
		static let postCode = "DETIALS.posteCode"

		static let sectionLogin = "DETAILS.sectionLogin"
		static let username = "DETIALS.username"
		static let password = "DETIALS.password"
		static let salt = "DETIALS.salt"
		static let md5 = "DETIALS.md5"
		static let sha1 = "DETIALS.sha1"
		static let sha256 = "DETIALS.sha256"
	}
}
