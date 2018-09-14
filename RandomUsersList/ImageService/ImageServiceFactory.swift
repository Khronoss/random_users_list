//
//  ImageServiceFactory.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 14/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import Foundation

struct ImageServiceFactory {
	static func service() -> ImageService {
		let imageNetworkLayer = ImageNetworkLayer()
		let userDefaults = UserDefaults.standard
		let imageDataLayer = ImageDataLayer(userDefaults: userDefaults)
		let imageService = ImageService(networkLayer: imageNetworkLayer,
										dataLayer: imageDataLayer)

		return imageService
	}
}
