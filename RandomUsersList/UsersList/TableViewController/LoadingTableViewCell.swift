//
//  LoadingTableViewCell.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {
	@IBOutlet weak var loader: UIActivityIndicatorView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		loader.startAnimating()
	}
}

extension LoadingTableViewCell: ReusableViewIdentification {}
