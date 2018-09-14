//
//  EmptyCardHeaderView.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 14/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

class EmptyCardHeaderView: UITableViewHeaderFooterView {
	@IBOutlet weak var view: UIView!
	
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
		let nib = UINib(nibName: "EmptyCardHeaderView", bundle: bundle)
		
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
	}
}

extension EmptyCardHeaderView: ReusableViewIdentification {}
