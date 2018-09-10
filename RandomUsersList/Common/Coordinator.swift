//
//  Coordinator.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

protocol CoordinatorDelegate {
	mutating func coordinatorDidEnd(withIdentifier identifier: String)
}

protocol Coordinator: CoordinatorDelegate {
	var children: [Coordinator] { get set }
	var identifier: String { get }
	var delegate: CoordinatorDelegate? { get }
	var controller: UIViewController? { get set }
	
	mutating func start(completion: (() -> Void)?)
}

extension CoordinatorDelegate where Self: Coordinator {
	mutating func coordinatorDidEnd(withIdentifier identifier: String) {
		guard let index = children.index(where: { $0.identifier == identifier }) else {
			return
		}
		children.remove(at: index)
	}
}
