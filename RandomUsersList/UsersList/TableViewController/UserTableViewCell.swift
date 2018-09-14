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
	@IBOutlet weak var pictureImageView: UIImageView!
	@IBOutlet weak var cardView: CardView!
	
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
	
	var userPicture: UIImage? {
		didSet {
			pictureImageView.image = userPicture
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		nameLabel.numberOfLines = 0
		nameLabel.textColor = UIMetric.textColor
		emailLabel.numberOfLines = 0
		emailLabel.textColor = UIMetric.textColorLight
		pictureImageView.clipsToBounds = true
		pictureImageView.layer.cornerRadius = UIMetric.cornerRadiusSmall
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		cardView.backgroundColor = selected ? UIColor(white: 0.98, alpha: 1) : UIColor.white
		cardView.showShadow = !selected
	}
}

extension UserTableViewCell: ReusableViewIdentification {}
