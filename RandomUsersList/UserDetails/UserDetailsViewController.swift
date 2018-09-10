//
//  UserDetailsViewController.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
	@IBOutlet weak var tableView: UITableView!
	
	let user: User
	var tableViewController: IUserDetailsTableViewController
	
	init(user: User,
		 tableViewController: IUserDetailsTableViewController) {
		self.user = user
		self.tableViewController = tableViewController
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("UserDetailsController wasn't mean to be initialized from Storyboard")
	}

	override func viewDidLoad() {
        super.viewDidLoad()

		tableViewController.tableView = tableView
		tableViewController.user = user
	}
}
