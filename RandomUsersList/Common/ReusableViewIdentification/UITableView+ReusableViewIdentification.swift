//
//  UITableView+ReusableViewIdentification.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 10/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

extension UITableView {
	func registerNibWithClass<T>(cellClass: T.Type)
		where T: NSObject & ReusableViewIdentification {
			let bundle = Bundle(for: cellClass.classForCoder())
			let nib = UINib(nibName: cellClass.nibName, bundle: bundle)
			
			self.register(nib, forCellReuseIdentifier: cellClass.defaultIdentifier)
	}
	
	func dequeueReusableCell<T>(for indexPath: IndexPath) -> T
		where T: ReusableViewIdentification {
			let cell = self.dequeueReusableCell(withIdentifier: T.defaultIdentifier,
												for: indexPath) as? T
			
			return cell!
	}
}
