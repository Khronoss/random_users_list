//
//  Localizable.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation

protocol Localizable {
	func localizedString(_ string: String) -> String
}

protocol LocalizableObject: Localizable {
	var localizator: Localizable? { get set }
}

extension LocalizableObject {
	func localizedString(_ string: String) -> String {
		return localizator?.localizedString(string) ?? string
	}
}
