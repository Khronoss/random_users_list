//
//  UserDetailsTableViewController.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

protocol IUserDetailsTableViewController {
	var tableView: UITableView? { get set }
	var user: User? { get set }
}

class UserDetailsTableViewController: NSObject {
	var tableView: UITableView? {
		didSet {
			tableView?.delegate = self
			tableView?.dataSource = self
			
			registerCells()
		}
	}
	
	var user: User? {
		didSet {
			updateTableViewHeader()
			tableView?.reloadData()
		}
	}
	
	func registerCells() {
		
	}
	
	func updateTableViewHeader() {
		createTableViewHeaderIfNeeded()
		
		guard let header = tableView?.tableHeaderView as? UserDetailsTableViewHeader,
			let user = self.user else {
			return
		}
		
		header.name = user.name.fullName(withTitle: true)
		header.email = user.email
	}
	
	func createTableViewHeaderIfNeeded() {
		guard tableView?.tableHeaderView == nil,
		let tableView = self.tableView else {
			return
		}
		
		let headerSize = CGSize(width: tableView.bounds.width,
								height: UIMetric.tableViewHeaderHeight)
		let header = UserDetailsTableViewHeader(frame: CGRect(origin: .zero, size: headerSize))
		
		tableView.tableHeaderView = header
	}
}

extension UserDetailsTableViewController: IUserDetailsTableViewController {}

extension UserDetailsTableViewController: UITableViewDelegate {}

extension UserDetailsTableViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
}
