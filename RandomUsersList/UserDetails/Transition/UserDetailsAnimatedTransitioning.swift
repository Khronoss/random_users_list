//
//  UserDetailsAnimatedTransitioning.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 13/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

class UserDetailsAnimatedTransitioning: NSObject {
	let isPresenting: Bool

	init(isPresenting: Bool) {
		self.isPresenting = isPresenting
		
		super.init()
	}
}

extension UserDetailsAnimatedTransitioning: UIViewControllerAnimatedTransitioning {
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return 0.6
	}
	
	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		let modalView = isPresenting ? transitionContext.view(forKey: .to) : transitionContext.view(forKey: .from)
		guard let view = modalView else {
				return
		}
		
		let container = transitionContext.containerView
		
		let upperFrame = container.bounds
		let lowerFrame = container.bounds.offsetBy(dx: 0, dy: container.bounds.height)

		view.frame = isPresenting ? lowerFrame : upperFrame

		container.addSubview(view)

		UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
			view.frame = self.isPresenting ? upperFrame : lowerFrame
		}) { _ in
			let success = !transitionContext.transitionWasCancelled
			if !success {
				view.removeFromSuperview()
			}
			transitionContext.completeTransition(success)
		}
	}
}
