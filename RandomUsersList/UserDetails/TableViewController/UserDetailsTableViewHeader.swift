//
//  UserDetailsTableViewHeader.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

class UserDetailsTableViewHeader: UIView {
	@IBOutlet private var view: UIView!
	
	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var emailLabel: UILabel!
	
	var name: String? {
		didSet {
			nameLabel.text = name
		}
	}
	
	var email: String? {
		didSet {
			emailLabel.text = email
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		loadNibView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		loadNibView()
	}
	
	func loadNibView() {
		let bundle = Bundle(for: classForCoder)
		let nib = UINib(nibName: "UserDetailsTableViewHeader", bundle: bundle)
		
		guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
			return
		}
		
		self.view = view
		view.frame = bounds
		addSubview(view)
		
		view.leftAnchor.constraint(equalTo: leftAnchor)
		view.topAnchor.constraint(equalTo: topAnchor)
		rightAnchor.constraint(equalTo: view.rightAnchor)
		bottomAnchor.constraint(equalTo: view.bottomAnchor)
		
		view.backgroundColor = UIColor.clear
		
		nameLabel.textColor = UIColor.white
		emailLabel.textColor = UIColor.white
		profileImageView.clipsToBounds = true
		profileImageView.layer.cornerRadius = UIMetric.cornerRadius
	}
}
