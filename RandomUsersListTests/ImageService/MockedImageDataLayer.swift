//
//  MockedImageDataLayer.swift
//  RandomUsersListTests
//
//  Created by Anthony Merle on 15/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

@testable import RandomUsersList
import UIKit

class MockedImageDataLayer {
	var savedImages: [String: UIImage] = [:]
}

extension MockedImageDataLayer: IImageDataLayer {
	func retrieveImage(forURL url: URL) -> UIImage? {
		return savedImages[url.absoluteString]
	}
	
	func saveImage(_ image: UIImage,
				   forURL url: URL) {
		savedImages[url.absoluteString] = image
	}
}
