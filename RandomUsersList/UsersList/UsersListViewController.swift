//
//  UsersListViewController.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

class UsersListViewController: UIViewController {
	@IBOutlet weak var tableView: UITableView!
	
	let usersListService: IUsersListService
	var tableViewController: IUsersListTableViewController
	
	var delegate: UserDetailsPresenter?
	var currentPageIndex: Int = 0
	
	required init(usersListService: IUsersListService,
				  tableViewController: IUsersListTableViewController) {
		self.usersListService = usersListService
		self.tableViewController = tableViewController

		super.init(nibName: nil, bundle: nil)
		
		self.tableViewController.delegate = self
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("UsersListViewController wasn't mean to be initialized from Storyboard")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

		tableViewController.tableView = tableView
		loadUsersList(pageIndex: 1)
    }
	
	func loadUsersList(pageIndex: Int) {
		currentPageIndex = pageIndex
		
		usersListService.getUsersList(forPage: currentPageIndex) { (users, error) in
			guard let usersList = users else {
				print("Failed loading User's list")
				print(error!)
				return
			}
			
			print("Loaded Users list")
			if pageIndex == 0 {
				self.tableViewController.users = usersList
			} else {
				self.tableViewController.users += usersList
			}
		}
	}
}

extension UsersListViewController: IUsersListTableViewControllerDelegate {
	func loadMoreUsers() {
		loadUsersList(pageIndex: currentPageIndex + 1)
	}
	
	func usersListController(_ controller: IUsersListTableViewController,
							 didSelectUser user: User) {
		print("User selected from list: \(user.name.fullName(withTitle: false))")
		delegate?.presentUserDetails(user, from: self)
	}
}
