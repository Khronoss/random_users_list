//
//  MockedImageNetworkLayer.swift
//  RandomUsersListTests
//
//  Created by Anthony Merle on 15/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

@testable import RandomUsersList
import UIKit

class MockedImageNetworkLayer {
	var loadImageCalled = false
	
	static let forceFailureURL = URL(string: "http://www.fail.com")!
}

extension MockedImageNetworkLayer: IImageNetworkLayer {
	func loadImage(atURL url: URL,
				   completion: @escaping (UIImage?, Error?) -> Void) {
		loadImageCalled = true
		
		if url.absoluteString == MockedImageNetworkLayer.forceFailureURL.absoluteString {
			let error = NSError(domain: "MockedImageNetworkLayer", code: 999, userInfo: nil)
			return completion(nil, error)
		}

		completion(UIImage(), nil)
	}
}
