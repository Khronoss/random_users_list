//
//  UserDetailsCoordinator.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

struct UserDetailsCoordinator {
	var children: [Coordinator] = []
	var identifier: String = CoordinatorIdentifier.userDetails
	var delegate: CoordinatorDelegate?
	var controller: UIViewController?
	
	private unowned let sourceController: UIViewController
	private let user: User
	
	init(sourceController: UIViewController,
		 user: User) {
		self.sourceController = sourceController
		self.user = user
	}
}

extension UserDetailsCoordinator: Coordinator {
	func start() {
		let localizator = Localizator()
		let tableViewController = UserDetailsTableViewController(localizator: localizator)
		let imageService = ImageServiceFactory.service()
		let controller = UserDetailsViewController(user: self.user,
												   tableViewController: tableViewController,
												   imageService: imageService)
		controller.delegate = self
		
		sourceController.show(controller, sender: self)
	}
}

extension UserDetailsCoordinator: UserDetailsControllerDelegate {
	mutating func dismiss() {
		sourceController.dismiss(animated: true, completion: nil)
		delegate?.coordinatorDidEnd(withIdentifier: identifier)
	}
}
