//
//  CardView.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 14/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

class CardView: UIView {
	var hasRoundedCorners = true {
		didSet {
			updateCornerRadius()
		}
	}
	
	var showShadow = true {
		didSet {
			updateShadowView()
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		initView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		initView()
	}
	
	func initView() {
		layer.shadowColor = UIColor.black.cgColor
		layer.shadowOffset = CGSize(width: 1, height: 2)
		layer.shadowRadius = 3
		
		updateCornerRadius()
		updateShadowView()
	}
	
	func updateCornerRadius() {
		layer.cornerRadius = hasRoundedCorners ? UIMetric.cornerRadius : 0
	}
	
	func updateShadowView() {
		layer.shadowOpacity = showShadow ? 0.4 : 0
	}
}
