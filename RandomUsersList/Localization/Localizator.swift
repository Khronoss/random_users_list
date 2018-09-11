//
//  Localizator.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation

struct Localizator {}

extension Localizator: Localizable {
	func localizedString(_ string: String) -> String {
		return NSLocalizedString(string, comment: "")
	}
}
