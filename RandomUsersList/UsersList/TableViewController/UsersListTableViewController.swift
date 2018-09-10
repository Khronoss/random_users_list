//
//  UsersListTableViewController.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

protocol IUsersListTableViewControllerDelegate {
	func loadMoreUsers()
}

protocol IUsersListTableViewController {
	var tableView: UITableView? { get set }
	var users: [User] { get set }
	var delegate: IUsersListTableViewControllerDelegate? { get set }
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
			isLoadingMoreUsers = false
			tableView?.reloadData()
		}
	}
	
	var delegate: IUsersListTableViewControllerDelegate?
	var isLoadingMoreUsers: Bool = false
	
	func registerCells() {
		tableView?.registerNibWithClass(cellClass: UserTableViewCell.self)
		tableView?.registerNibWithClass(cellClass: LoadingTableViewCell.self)
	}

	func userCell(inTableView tableView: UITableView,
				  indexPath: IndexPath) -> UserTableViewCell {
		let cell: UserTableViewCell = tableView.dequeueReusableCell(for: indexPath)
		let user = users[indexPath.row]
		
		cell.name = user.name.fullName(withTitle: true)
		cell.email = user.email
		
		return cell
	}

	func loadingCell(inTableView tableView: UITableView,
					 indexPath: IndexPath) -> LoadingTableViewCell {
		let cell: LoadingTableViewCell = tableView.dequeueReusableCell(for: indexPath)
		
		cell.loader.startAnimating()
		
		return cell
	}
}

extension UsersListTableViewController: IUsersListTableViewController {}

extension UsersListTableViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView,
				   didSelectRowAt indexPath: IndexPath) {
		let user = users[indexPath.row]
		
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let offsetY = scrollView.contentOffset.y
		let contentHeight = scrollView.contentSize.height
		
		if offsetY > contentHeight - scrollView.frame.height,
			!isLoadingMoreUsers {
			isLoadingMoreUsers = true
			tableView?.reloadSections(IndexSet(integer: 1), with: .none)
			delegate?.loadMoreUsers()
		}
	}
}

extension UsersListTableViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return users.count
		} else {
			return isLoadingMoreUsers ? 1 : 0
		}
	}
	
	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if indexPath.section == 0 {
			return userCell(inTableView: tableView, indexPath: indexPath)
		} else {
			return loadingCell(inTableView: tableView, indexPath: indexPath)
		}
	}
}
