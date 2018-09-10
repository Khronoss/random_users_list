//
//  UsersListViewController.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

class UsersListViewController: UIViewController {
	let usersListService: IUsersListService
	var currentPageIndex: Int = 0
	
	required init(usersListService: IUsersListService) {
		self.usersListService = usersListService

		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("Controller wasn't mean to be initialized from Storyboard")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		loadUsersList(pageIndex: 1)
    }
	
	func loadUsersList(pageIndex: Int) {
		currentPageIndex = pageIndex
		
		usersListService.getUsersList(forPage: currentPageIndex) { (users, error) in
			if let error = error {
				print("Failed loading User's list")
				print(error)
				return
			}
			
			print("Loaded Users list")
		}
	}
}
