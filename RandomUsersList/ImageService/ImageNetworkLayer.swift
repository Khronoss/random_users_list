//
//  ImageNetworkLayer.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 14/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

protocol IImageNetworkLayer {
	func loadImage(atURL url: URL,
				   completion: @escaping (UIImage?, Error?) -> Void)
}

struct ImageNetworkLayer {}

extension ImageNetworkLayer: IImageNetworkLayer {
	func loadImage(atURL url: URL,
				   completion: @escaping (UIImage?, Error?) -> Void) {
		Alamofire.request(url).responseImage { (response) in
			completion(response.value, response.error)
		}
	}
}
