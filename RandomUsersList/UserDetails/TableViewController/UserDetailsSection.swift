//
//  UserDetailsSection.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation

struct UserDetailsSection {
	typealias Row = (title: String, value: String)
	
	let title: String?
	let rows: [Row]
}
