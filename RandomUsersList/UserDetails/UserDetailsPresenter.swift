//
//  UserDetailsPresenter.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

protocol UserDetailsPresenter {
	mutating func presentUserDetails(_ user: User,
									 from controller: UIViewController)
}

extension UserDetailsPresenter where Self: Coordinator {
	mutating func presentUserDetails(_ user: User,
									 from controller: UIViewController) {
		let coordinator = UserDetailsCoordinator(sourceController: controller,
												 user: user)
		
		children.append(coordinator)
		coordinator.start()
	}
}
