//
//  PaginatedEnveloppeInformation.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation

struct PaginatedEnveloppeInformation: Decodable {
	let seed: String
	let results: Int
	let page: Int
}
