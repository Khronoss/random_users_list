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
	
	private weak var window: UIWindow?
	
	init(window: UIWindow?) {
		self.window = window
	}
}

extension UsersListCoordinator: Coordinator {
	mutating func start() {
		let networkLayer = UsersListNetworkLayer()
		let appDelegate = UIApplication.shared.delegate as? AppDelegate
		let dataLayer = UsersListDataLayer(context: appDelegate!.persistentContainer.viewContext)
		let usersListService = UsersListService(networkLayer: networkLayer,
												dataLayer: dataLayer)
		let tableController = UsersListTableViewController()
		let imageService = ImageServiceFactory.service()
		let controller = UsersListViewController(usersListService: usersListService,
												 tableViewController: tableController,
												 imageService: imageService)

		self.controller = controller
		controller.delegate = self
		
		window?.rootViewController = controller
		window?.makeKeyAndVisible()
	}
}

extension UsersListCoordinator: UserDetailsPresenter {}
