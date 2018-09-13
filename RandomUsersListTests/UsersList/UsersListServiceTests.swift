//
//  UsersListServiceTests.swift
//  RandomUsersListTests
//
//  Created by Anthony Merle on 13/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

@testable import RandomUsersList

import XCTest

class UsersListServiceTests: XCTestCase {
	var service: UsersListService!
	var mockedNetworkLayer: MockedUsersListNetworkLayer!
	var mockedDataLayer: MockedUsersListDataLayer!
	
    override func setUp() {
        super.setUp()

		mockedNetworkLayer = MockedUsersListNetworkLayer()
		mockedDataLayer = MockedUsersListDataLayer()
		
		service = UsersListService(networkLayer: mockedNetworkLayer,
								   dataLayer: mockedDataLayer)
	}
    
    override func tearDown() {
		mockedNetworkLayer = nil
		mockedDataLayer = nil
		service = nil

		super.tearDown()
    }

	func testLoadUsersSucceedShouldSaveUsersToDataLayer() {
		let users = (1...10).map { (value) -> User in
			let numberStr = String(format: "%03d", value)
			return User.createRandomUser(firstname: numberStr,
										 lastname: numberStr)
		}
		mockedNetworkLayer.users = users
		
		let expectation = XCTestExpectation(description: "Users should be loaded")

		service.getUsersList(forPage: 0,
							 countPerPage: 10) { (users, error) in
								XCTAssertNil(error)
								XCTAssertNotNil(users)
								XCTAssertEqual(users!.count, 10)
								
								XCTAssertTrue(self.mockedNetworkLayer.loadUsersListCalled)
								XCTAssertFalse(self.mockedDataLayer.retrieveUsersCalled)
								XCTAssertTrue(self.mockedDataLayer.saveUsersCalled)
								
								expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 5)
	}

	func testLoadUsersFailedShouldRetrieveUsersFromDataLayer() {
		let users = (1...10).map { (value) -> User in
			let numberStr = String(format: "%03d", value)
			return User.createRandomUser(firstname: numberStr,
										 lastname: numberStr)
		}
		mockedDataLayer.users = users
		
		let expectation = XCTestExpectation(description: "Users should be loaded")
		
		service.getUsersList(forPage: MockedUsersListNetworkLayer.forceErrorIndex,
							 countPerPage: 10) { (users, error) in
								XCTAssertNil(error)
								XCTAssertNotNil(users)
								XCTAssertEqual(users!.count, 10)
								
								XCTAssertTrue(self.mockedNetworkLayer.loadUsersListCalled)
								XCTAssertTrue(self.mockedDataLayer.retrieveUsersCalled)
								XCTAssertFalse(self.mockedDataLayer.saveUsersCalled)
								
								expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 5)
	}

	func testLoadUsersFailedAndDataLayerEmptyShouldCompleteWithNetworkLayerError() {
		let expectation = XCTestExpectation(description: "Users should be loaded")
		
		service.getUsersList(forPage: MockedUsersListNetworkLayer.forceErrorIndex,
							 countPerPage: 10) { (users, error) in
								XCTAssertNotNil(error)
								XCTAssertNil(users)
								
								XCTAssertTrue(self.mockedNetworkLayer.loadUsersListCalled)
								XCTAssertTrue(self.mockedDataLayer.retrieveUsersCalled)
								XCTAssertFalse(self.mockedDataLayer.saveUsersCalled)
								
								expectation.fulfill()
		}
		
		wait(for: [expectation], timeout: 5)
	}
}
