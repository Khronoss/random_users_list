//
//  ImageDataLayerTests.swift
//  RandomUsersListTests
//
//  Created by Anthony Merle on 15/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

@testable import RandomUsersList
import XCTest

class ImageDataLayerTests: XCTestCase {
	var dataLayer: ImageDataLayer!
	var mockedUserDefaults: MockedUserDefaults!
	
    override func setUp() {
        super.setUp()

		mockedUserDefaults = MockedUserDefaults()
		dataLayer = ImageDataLayer(userDefaults: mockedUserDefaults)
	}
    
    override func tearDown() {
		mockedUserDefaults = nil
		dataLayer = nil
		
		super.tearDown()
    }

	func testDataLayerShouldSaveImageAndRetrieveItWithURL() {
		let image = UIImage(named: "Jackpot")
		let url = URL(string: "http://www.image.com")!
		
		dataLayer.saveImage(image!, forURL: url)
		
		let expectation = XCTestExpectation(description: "Should save image")
		
		DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) {
			let retrievedImage = self.dataLayer.retrieveImage(forURL: url)

			XCTAssertTrue(self.mockedUserDefaults.setValueCalled)
			XCTAssertNotNil(retrievedImage)
			
			expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 5)
	}
}
