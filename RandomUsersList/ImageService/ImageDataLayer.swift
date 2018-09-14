//
//  ImageDataLayer.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 14/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

protocol IImageDataLayer {
	func saveImage(_ image: UIImage, forURL url: URL)
	func retrieveImage(forURL url: URL) -> UIImage?
}

struct ImageDataLayer {
	static let imagesCacheKey = "cachedImages"
	
	let userDefaults: UserDefaults
	
	func getCachedImages() -> [String: Data]? {
		return userDefaults.dictionary(forKey: ImageDataLayer.imagesCacheKey) as? [String: Data]
	}
}

extension ImageDataLayer: IImageDataLayer {
	func saveImage(_ image: UIImage, forURL url: URL) {
		DispatchQueue.global().async {
			var cachedImages = self.getCachedImages() ?? [:]
			
			cachedImages[url.absoluteString] = UIImagePNGRepresentation(image)!
			
			self.userDefaults.set(cachedImages, forKey: ImageDataLayer.imagesCacheKey)
		}
	}
	
	func retrieveImage(forURL url: URL) -> UIImage? {
		var cachedImages = getCachedImages()
		guard let data = cachedImages?[url.absoluteString] else {
			return nil
		}
		return UIImage(data: data)
	}
}
