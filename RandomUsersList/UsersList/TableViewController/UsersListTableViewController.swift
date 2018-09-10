//
//  UsersListTableViewController.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

protocol IUsersListTableViewController {
	var tableView: UITableView? { get set }
	var users: [User] { get set }
}

class UsersListTableViewController: NSObject {
	var tableView: UITableView? {
		didSet {
			tableView?.delegate = self
			tableView?.dataSource = self
			
			registerCells()
		}
	}
	
	var users: [User] = [] {
		didSet {
			tableView?.reloadData()
		}
	}
	
	func registerCells() {
		tableView?.registerNibWithClass(cellClass: UserTableViewCell.self)
	}
}

extension UsersListTableViewController: IUsersListTableViewController {}

extension UsersListTableViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView,
				   didSelectRowAt indexPath: IndexPath) {
		let user = users[indexPath.row]
		
	}
}

extension UsersListTableViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int {
		return users.count
	}
	
	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: UserTableViewCell = tableView.dequeueReusableCell(for: indexPath)
		let user = users[indexPath.row]
		
		cell.name = user.name.fullName(withTitle: true)
		cell.email = user.email
		
		return cell
	}
}
