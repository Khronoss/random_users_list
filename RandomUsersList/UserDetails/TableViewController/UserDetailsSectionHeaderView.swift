//
//  UserDetailsSectionHeaderView.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

class UserDetailsSectionHeaderView: UITableViewHeaderFooterView {
	weak var titleLabel: UILabel!
	weak var separator: UIView!
	
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
		
		initView()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		initView()
	}
	
	func initView() {
		let label = UILabel(frame: .zero)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		label.font = UIFont.boldSystemFont(ofSize: 17)
		addSubview(label)
		
		let separator = UIView(frame: .zero)
		separator.translatesAutoresizingMaskIntoConstraints = false
		addSubview(separator)
		
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: topAnchor,
									   constant: UIMetric.defaultSpacing),
			label.leadingAnchor.constraint(equalTo: leadingAnchor,
										   constant: UIMetric.defaultSpacing),
			trailingAnchor.constraint(equalTo: label.trailingAnchor,
									  constant: UIMetric.defaultSpacing),
			separator.heightAnchor.constraint(equalToConstant: 1),
			separator.topAnchor.constraint(greaterThanOrEqualTo: label.bottomAnchor,
										   constant: UIMetric.defaultSpacingSmall),
			separator.leadingAnchor.constraint(equalTo: label.leadingAnchor),
			separator.trailingAnchor.constraint(equalTo: label.trailingAnchor),
			bottomAnchor.constraint(equalTo: separator.bottomAnchor)
			])
		
		self.titleLabel = label
		self.separator = separator
	}
}

extension UserDetailsSectionHeaderView: ReusableViewIdentification {}
