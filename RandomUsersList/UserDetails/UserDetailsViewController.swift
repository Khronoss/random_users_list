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
	let imageService: IImageService
	
	init(user: User,
		 tableViewController: IUserDetailsTableViewController,
		 imageService: IImageService) {
		self.user = user
		self.tableViewController = tableViewController
		self.imageService = imageService
		
		super.init(nibName: nil, bundle: nil)
		
//		transitioningDelegate = self
//		modalPresentationStyle = .custom
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("UserDetailsController wasn't mean to be initialized from Storyboard")
	}

	override func viewDidLoad() {
        super.viewDidLoad()

		view.backgroundColor = UIMetric.applicationColor
		tableView.backgroundColor = UIColor.clear
		
		tableViewController.tableView = tableView
		tableViewController.user = user
		loadUserPicture(withUrl: user.picture.large)
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		buttonBackground.layer.cornerRadius = buttonBackground.bounds.height / 2
	}
	
	@IBAction func dismissTapped() {
		delegate?.dismiss()
	}
	
	func loadUserPicture(withUrl url: URL) {
		imageService.getImage(atURL: url) { (image, error) in
			guard let loadedImage = image else {
				print("Could not load user's picture")
				return
			}
			self.tableViewController.userPicture = loadedImage
		}
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
