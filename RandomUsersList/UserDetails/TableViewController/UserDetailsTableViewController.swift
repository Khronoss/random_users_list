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
	let sizingHeader: UserDetailsSectionHeaderView
	
	var localizator: Localizable?
	
	var tableView: UITableView? {
		didSet {
			tableView?.delegate = self
			tableView?.dataSource = self
			
			registerCells()
		}
	}
	
	var user: User? {
		didSet {
			if let user = self.user {
				updateTableViewHeader(withUser: user)
				initSections(withUser: user)
			}
		}
	}
	var sections: [UserDetailsSection] = [] {
		didSet {
			tableView?.reloadData()
		}
	}
	
	init(localizator: Localizable?) {
		let sizingHeader = UserDetailsSectionHeaderView(frame: .zero)
		sizingHeader.translatesAutoresizingMaskIntoConstraints = false
		
		self.sizingHeader = sizingHeader
		self.localizator = localizator
		
		super.init()
	}

	func registerCells() {
		tableView?.registerHeaderClass(cellClass: UserDetailsSectionHeaderView.self)
		tableView?.registerNibWithClass(cellClass: UserDetailsRowTableViewCell.self)
	}
	
	func updateTableViewHeader(withUser user: User) {
		createTableViewHeaderIfNeeded()
		
		guard let header = tableView?.tableHeaderView as? UserDetailsTableViewHeader else {
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
	
	func initSections(withUser user: User) {
		let sections: [UserDetailsSection] = [
			UserDetailsSection(title: nil,
							   rows: [
								(title: localizedString(LocalizableKey.UserDetails.gender),
								 value: user.gender.rawValue),
								(title: localizedString(LocalizableKey.UserDetails.phone),
								 value: user.phone),
								(title: localizedString(LocalizableKey.UserDetails.nationality),
								 value: user.nationality)
				]),
			UserDetailsSection(title: localizedString(LocalizableKey.UserDetails.sectionLocation),
							   rows: [
								(title: localizedString(LocalizableKey.UserDetails.street),
								 value: user.location.street),
								(title: localizedString(LocalizableKey.UserDetails.city),
								 value: user.location.city),
								(title: localizedString(LocalizableKey.UserDetails.state),
								value: user.location.state),
								(title: localizedString(LocalizableKey.UserDetails.postCode),
								value: "\(user.location.postCode)")
				])
		]
		self.sections = sections
	}
	
	func configSectionHeader(_ header: UserDetailsSectionHeaderView,
							 forSection section: UserDetailsSection) {
		header.title = section.title
		header.tintColor = UIColor.lightGray
	}
}

extension UserDetailsTableViewController: IUserDetailsTableViewController {}

extension UserDetailsTableViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView,
				   viewForHeaderInSection section: Int) -> UIView? {
		let sectionItem = sections[section]
		guard let _ = sectionItem.title else {
			return nil
		}
		
		let header: UserDetailsSectionHeaderView = tableView.dequeueReusableHeader()
		
		configSectionHeader(header, forSection: sectionItem)
		
		return header
	}
	
	func tableView(_ tableView: UITableView,
				   heightForHeaderInSection section: Int) -> CGFloat {
		let sectionItem = sections[section]
		guard let _ = sectionItem.title else {
			return 1
		}
		
		configSectionHeader(sizingHeader, forSection: sectionItem)

		let targetSize = CGSize(width: tableView.frame.width,
								height: 0)
		let size = sizingHeader.systemLayoutSizeFitting(targetSize,
														withHorizontalFittingPriority: .required,
														verticalFittingPriority: .defaultLow)
		
		return size.height
	}
	
	func tableView(_ tableView: UITableView,
				   heightForFooterInSection section: Int) -> CGFloat {
		return 1
	}
}

extension UserDetailsTableViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return sections.count
	}
	
	func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int {
		let sectionItem = sections[section]
	
		return sectionItem.rows.count
	}
	
	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: UserDetailsRowTableViewCell = tableView.dequeueReusableCell(for: indexPath)
		let sectionItem = sections[indexPath.section]
		let row = sectionItem.rows[indexPath.row]
		
		cell.title = row.title
		cell.value = row.value
		
		return cell
	}
}

extension UserDetailsTableViewController: LocalizableObject {}
