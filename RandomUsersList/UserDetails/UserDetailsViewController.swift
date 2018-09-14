//
//  UserDetailsViewController.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

protocol UserDetailsControllerDelegate {
	mutating func dismiss()
}

class UserDetailsViewController: UIViewController {
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var buttonBackground: UIVisualEffectView!
	
	var delegate: UserDetailsControllerDelegate?
	
	let user: User
	var tableViewController: IUserDetailsTableViewController
	
	init(user: User,
		 tableViewController: IUserDetailsTableViewController) {
		self.user = user
		self.tableViewController = tableViewController
		
		super.init(nibName: nil, bundle: nil)
		
		transitioningDelegate = self
		modalPresentationStyle = .custom
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("UserDetailsController wasn't mean to be initialized from Storyboard")
	}

	override func viewDidLoad() {
        super.viewDidLoad()

		tableViewController.tableView = tableView
		tableViewController.user = user
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		buttonBackground.layer.cornerRadius = buttonBackground.bounds.height / 2
	}
	
	@IBAction func dismissTapped() {
		delegate?.dismiss()
	}
}

extension UserDetailsViewController: UIViewControllerTransitioningDelegate {
	func animationController(forPresented presented: UIViewController,
							 presenting: UIViewController,
							 source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return UserDetailsAnimatedTransitioning(isPresenting: true)
	}
	
	func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return UserDetailsAnimatedTransitioning(isPresenting: false)
	}
}
