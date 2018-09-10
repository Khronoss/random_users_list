//
//  UserTableViewCell.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
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
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		nameLabel.numberOfLines = 0
		emailLabel.numberOfLines = 0
	}
}

extension UserTableViewCell: ReusableViewIdentification {}
