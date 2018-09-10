//
//  ReusableViewIdentification.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation

protocol ReusableViewIdentification {
	static var nibName: String { get }
	static var defaultIdentifier: String { get }
}

extension ReusableViewIdentification {
	static var nibName: String {
		return String(describing: self)
	}
	
	static var defaultIdentifier: String {
		return String(describing: self)
	}
}
