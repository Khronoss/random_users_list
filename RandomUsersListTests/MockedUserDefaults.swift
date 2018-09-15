//
//  MockedUserDefaults.swift
//  RandomUsersListTests
//
//  Created by Anthony Merle on 15/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation

class MockedUserDefaults: UserDefaults {
	var dict: [String: Any] = [:]
	var setValueCalled = false
	
	override func set(_ value: Any?,
					  forKey defaultName: String) {
		setValueCalled = true
		dict[defaultName] = value
	}
	
	override func dictionary(forKey defaultName: String) -> [String : Any]? {
		return dict[defaultName] as? [String: Any]
	}
}
