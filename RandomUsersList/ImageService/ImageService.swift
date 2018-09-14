//
//  ImageService.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 14/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit

protocol IImageService {
	func getImage(atURL url: URL,
				  completion: @escaping (UIImage?, Error?) -> Void)
}

struct ImageService {
	let networkLayer: IImageNetworkLayer
	let dataLayer: IImageDataLayer
}

extension ImageService: IImageService {
	func getImage(atURL url: URL,
				  completion: @escaping (UIImage?, Error?) -> Void) {
		networkLayer.loadImage(atURL: url) { (image, error) in
			guard let loadedImage = image else {
				guard let cachedImage = self.dataLayer.retrieveImage(forURL: url) else {
					return completion(nil, error)
				}
				return completion(cachedImage, nil)
			}
			self.dataLayer.saveImage(loadedImage, forURL: url)
			completion(loadedImage, error)
		}
	}
}
