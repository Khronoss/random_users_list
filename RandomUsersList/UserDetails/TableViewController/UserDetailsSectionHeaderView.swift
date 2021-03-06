//
//  UserDetailsSectionHeaderView.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

class UserDetailsSectionHeaderView: UITableViewHeaderFooterView {
	@IBOutlet var view: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var separator: UIView!
	
	var title: String? {
		didSet {
			titleLabel.text = title
		}
	}
	
	override var tintColor: UIColor! {
		didSet {
			separator.backgroundColor = tintColor
		}
	}
	
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		
		loadView()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		loadView()
	}
	
	func loadView() {
		let bundle = Bundle(for: classForCoder)
		let nib = UINib(nibName: "UserDetailsSectionHeaderView", bundle: bundle)
		
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
		
		titleLabel.numberOfLines = 0
		titleLabel.textColor = UIMetric.textColor
	}
}

extension UserDetailsSectionHeaderView: ReusableViewIdentification {}
