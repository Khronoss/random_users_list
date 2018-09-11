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
		where T: UITableViewCell & ReusableViewIdentification {
			let bundle = Bundle(for: cellClass.classForCoder())
			let nib = UINib(nibName: cellClass.nibName, bundle: bundle)
			
			self.register(nib, forCellReuseIdentifier: cellClass.defaultIdentifier)
	}
	
	func dequeueReusableCell<T>(for indexPath: IndexPath) -> T
		where T: UITableViewCell & ReusableViewIdentification {
			let cell = self.dequeueReusableCell(withIdentifier: T.defaultIdentifier,
												for: indexPath) as? T
			
			return cell!
	}

	func registerHeaderClass<T>(cellClass: T.Type)
		where T: UITableViewHeaderFooterView & ReusableViewIdentification {
			self.register(cellClass.classForCoder(),
						  forHeaderFooterViewReuseIdentifier: cellClass.defaultIdentifier)
	}

	func dequeueReusableHeader<T>() -> T
		where T: UITableViewHeaderFooterView & ReusableViewIdentification {
			let cell = self.dequeueReusableHeaderFooterView(withIdentifier: T.defaultIdentifier) as? T
			
			return cell!
	}
}
