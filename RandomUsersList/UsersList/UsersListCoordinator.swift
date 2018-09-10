//
//  UsersListCoordinator.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

struct UsersListCoordinator {
	var children: [Coordinator] = []
	var identifier: String = CoordinatorIdentifier.usersList
	var delegate: CoordinatorDelegate?
	var controller: UIViewController?
	
	private var window: UIWindow?
	
	init(window: UIWindow?) {
		self.window = window
	}
}

extension UsersListCoordinator: Coordinator {
	mutating func start(completion: (() -> Void)?) {
		let controller = UsersListViewController()
		self.controller = controller
		
		window?.rootViewController = controller
		window?.makeKeyAndVisible()
	}
}
