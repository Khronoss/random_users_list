//
//  UserDetailsRowTableViewCell.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

class UserDetailsRowTableViewCell: UITableViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var valueLabel: UILabel!
	
	var title: String? {
		didSet {
			titleLabel.text = title
		}
	}
	
	var value: String? {
		didSet {
			valueLabel.text = value
		}
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()

		titleLabel.numberOfLines = 0
		valueLabel.numberOfLines = 0
	}
}

extension UserDetailsRowTableViewCell: ReusableViewIdentification {}
