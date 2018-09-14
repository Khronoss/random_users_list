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
	func usersListController(_ controller: IUsersListTableViewController,
							 didSelectUser user: User)
}

protocol IUsersListTableViewController {
	var tableView: UITableView? { get set }
	var users: [User] { get set }
	var delegate: IUsersListTableViewControllerDelegate? { get set }
	
	func setPicture(_ image: UIImage?,
					forUser user: User)
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
	var userPictures: [String: UIImage] = [:]
	
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
		cell.userPicture = userPictures[user.email]
		
		return cell
	}

	func loadingCell(inTableView tableView: UITableView,
					 indexPath: IndexPath) -> LoadingTableViewCell {
		let cell: LoadingTableViewCell = tableView.dequeueReusableCell(for: indexPath)
		
		cell.loader.startAnimating()
		
		return cell
	}
}

extension UsersListTableViewController: IUsersListTableViewController {
	func setPicture(_ image: UIImage?,
					forUser user: User) {
		userPictures[user.email] = image
		if let index = users.index(where: { $0.email == user.email }) {
			let section = IndexPath(row: index, section: 0)
			tableView?.reloadRows(at: [section], with: .none)
		}
	}
}

extension UsersListTableViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView,
				   didSelectRowAt indexPath: IndexPath) {
		let user = users[indexPath.row]
		
		delegate?.usersListController(self,
									  didSelectUser: user)
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let offsetY = scrollView.contentOffset.y
		let contentHeight = scrollView.contentSize.height
		
		if offsetY > contentHeight - scrollView.frame.height,
			!isLoadingMoreUsers {
			print("UsersListTableViewController: Asking delegate to load more users")
			isLoadingMoreUsers = true
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
			return 1
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
