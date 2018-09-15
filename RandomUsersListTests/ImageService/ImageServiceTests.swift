//
//  ImageServiceTests.swift
//  RandomUsersListTests
//
//  Created by Anthony Merle on 15/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

@testable import RandomUsersList
import XCTest

class ImageServiceTests: XCTestCase {
	var service: ImageService!
	var mockedNetworkLayer: MockedImageNetworkLayer!
	var mockedDataLayer: MockedImageDataLayer!

    override func setUp() {
        super.setUp()

		mockedNetworkLayer = MockedImageNetworkLayer()
		mockedDataLayer = MockedImageDataLayer()
		
		service = ImageService(networkLayer: mockedNetworkLayer,
							   dataLayer: mockedDataLayer)
	}
    
    override func tearDown() {
		mockedNetworkLayer = nil
		mockedDataLayer = nil
		service = nil
		
		super.tearDown()
    }
	
	func testLoadImageSuccessShouldSaveImageIntoDataLayer() {
		let url = URL(string: "http://www.image.com")!
		
		let expectation = XCTestExpectation(description: "Image to be loaded and saved")
		
		service.getImage(atURL: url) { (image, error) in
			XCTAssertNil(error)
			XCTAssertNotNil(image)
			XCTAssertTrue(self.mockedNetworkLayer.loadImageCalled)
			XCTAssertNotNil(self.mockedDataLayer.savedImages[url.absoluteString])
			
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 5)
	}

	func testLoadImageFailShouldRetrieveImageFromDataLayerIfExisting() {
		let url = MockedImageNetworkLayer.forceFailureURL
		mockedDataLayer.savedImages[url.absoluteString] = UIImage()
		
		let expectation = XCTestExpectation(description: "Image load to fail and retrieve from data layer")
		
		service.getImage(atURL: url) { (image, error) in
			XCTAssertNil(error)
			XCTAssertNotNil(image)
			XCTAssertTrue(self.mockedNetworkLayer.loadImageCalled)
			XCTAssertNotNil(self.mockedDataLayer.savedImages[url.absoluteString])
			
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 5)
	}

	func testLoadImageFailShouldRetrieveImageFromDataLayerButIfNotExistingShouldCompleteWithNetworkError() {
		let url = MockedImageNetworkLayer.forceFailureURL
		
		let expectation = XCTestExpectation(description: "Image load to fail and complete with network error")
		
		service.getImage(atURL: url) { (image, error) in
			XCTAssertNotNil(error)
			XCTAssertNil(image)
			XCTAssertTrue(self.mockedNetworkLayer.loadImageCalled)
			XCTAssertNil(self.mockedDataLayer.savedImages[url.absoluteString])
			
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 5)
	}
}
