//
//  CardView.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 14/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

class CardView: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		initView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		initView()
	}
	
	func initView() {
		layer.cornerRadius = UIMetric.cornerRadius
		
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOffset = CGSize(width: 1, height: 2)
		layer.shadowRadius = 3
		layer.shadowOpacity = 0.4
	}
}
