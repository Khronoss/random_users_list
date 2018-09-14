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
		let usersListController = isPresenting ? transitionContext.viewController(forKey: .from) : transitionContext.viewController(forKey: .to)
		guard let view = modalView,
			let controller = usersListController else {
				return
		}
		
		let container = transitionContext.containerView
		
		let upperFrame = container.bounds
		let lowerFrame = container.bounds.offsetBy(dx: 0, dy: container.bounds.height)

		let identityTransform = CGAffineTransform.identity
		let modifiedTranform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9).translatedBy(x: 0, y: 20)
		
		view.frame = isPresenting ? lowerFrame : upperFrame
		controller.view.transform = isPresenting ? identityTransform : modifiedTranform

		container.addSubview(view)

		UIView.animate(withDuration: transitionDuration(using: transitionContext),
					   delay: 0,
					   usingSpringWithDamping: 1,
					   initialSpringVelocity: 1,
					   options: UIViewAnimationOptions.curveEaseOut,
					   animations: {
						view.frame = self.isPresenting ? upperFrame : lowerFrame
						controller.view.transform = self.isPresenting ? modifiedTranform : identityTransform
		}) { (_) in
			let success = !transitionContext.transitionWasCancelled
			if !success && self.isPresenting {
				view.removeFromSuperview()
			}
			transitionContext.completeTransition(success)
		}
	}
}
