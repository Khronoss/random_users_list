//
//  UsersListDataLayerTests.swift
//  RandomUsersListTests
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//

@testable import RandomUsersList

import XCTest
import CoreData

class UsersListDataLayerTests: XCTestCase {
	var inMemoryContainer: InMemoryPersistenceLayer!
	var dataLayer: UsersListDataLayer!

    override func setUp() {
        super.setUp()
		
		inMemoryContainer = InMemoryPersistenceLayer()
		dataLayer = UsersListDataLayer(context: inMemoryContainer.container.viewContext)
    }
    
    override func tearDown() {
		flushData()
		
		inMemoryContainer = nil
		dataLayer = nil
		
        super.tearDown()
    }

	func flushData() {
		let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: "UserModel")
		let objs = try! inMemoryContainer.container.viewContext.fetch(fetchRequest)
		for case let obj as NSManagedObject in objs {
			inMemoryContainer.container.viewContext.delete(obj)
		}
		try! inMemoryContainer.container.viewContext.save()
	}
	
	func testSaveTwoUsersUsingCoreData() {
		let users: [User] = [
			createRandomUser(firstname: "First", lastname: "Last"),
			createRandomUser(firstname: "Foo", lastname: "Bar")
		]
		
		dataLayer.saveUsers(users, startingIdentifier: 0)
		
		let savedUsers = dataLayer.retrieveUsers(forPage: 0, countPerPage: 10)
		
		XCTAssertEqual(savedUsers.count, 2)
		XCTAssertEqual(savedUsers[0].name.firstname, "First")
	}
	
	func testSaveTenUsersAndRetrieveInSameOrder() {
		let users: [User] = [
			createRandomUser(firstname: "001", lastname: "001"),
			createRandomUser(firstname: "002", lastname: "002"),
			createRandomUser(firstname: "003", lastname: "003"),
			createRandomUser(firstname: "004", lastname: "004"),
			createRandomUser(firstname: "005", lastname: "005"),
			createRandomUser(firstname: "006", lastname: "006"),
			createRandomUser(firstname: "007", lastname: "007"),
			createRandomUser(firstname: "008", lastname: "008"),
			createRandomUser(firstname: "009", lastname: "009"),
			createRandomUser(firstname: "010", lastname: "010")
		]
		
		dataLayer.saveUsers(users, startingIdentifier: 0)

		let savedUsers = dataLayer.retrieveUsers(forPage: 0, countPerPage: 10)
		
		XCTAssertEqual(savedUsers.count, 10)
		XCTAssertEqual(savedUsers[0].name.firstname, "001")
		XCTAssertEqual(savedUsers[1].name.firstname, "002")
		XCTAssertEqual(savedUsers[2].name.firstname, "003")
		XCTAssertEqual(savedUsers[3].name.firstname, "004")
		XCTAssertEqual(savedUsers[4].name.firstname, "005")
		XCTAssertEqual(savedUsers[5].name.firstname, "006")
		XCTAssertEqual(savedUsers[6].name.firstname, "007")
		XCTAssertEqual(savedUsers[7].name.firstname, "008")
		XCTAssertEqual(savedUsers[8].name.firstname, "009")
		XCTAssertEqual(savedUsers[9].name.firstname, "010")
	}
	
	func testSaveTwentyUsersAndRetrieveTenSecondPageInSameOrder() {
		let users = (1...20).map { (value) -> User in
			let numberStr = String(format: "%03d", value)
			return self.createRandomUser(firstname: numberStr,
										 lastname: numberStr)
		}
		
		dataLayer.saveUsers(users, startingIdentifier: 0)

		let savedUsers = dataLayer.retrieveUsers(forPage: 1, countPerPage: 10)
		
		XCTAssertEqual(savedUsers.count, 10)
		XCTAssertEqual(savedUsers[0].name.firstname, "011")
		XCTAssertEqual(savedUsers[1].name.firstname, "012")
		XCTAssertEqual(savedUsers[2].name.firstname, "013")
		XCTAssertEqual(savedUsers[3].name.firstname, "014")
		XCTAssertEqual(savedUsers[4].name.firstname, "015")
		XCTAssertEqual(savedUsers[5].name.firstname, "016")
		XCTAssertEqual(savedUsers[6].name.firstname, "017")
		XCTAssertEqual(savedUsers[7].name.firstname, "018")
		XCTAssertEqual(savedUsers[8].name.firstname, "019")
		XCTAssertEqual(savedUsers[9].name.firstname, "020")
	}
	
	private func createRandomUser(firstname: String,
								  lastname: String) -> User {
		let user = User(gender: .male,
						name: UserName(title: "Mr.",
									   firstname: firstname,
									   lastname: lastname),
						location: UserLocation(street: "street",
											   city: "city",
											   state: "state",
											   postCode: "1234"),
						email: "email@mail.com",
						phone: "555-1234-5678",
						picture: UserPicture(large: URL(string: "https://www.example.com")!,
											 medium: URL(string: "https://www.example.com")!,
											 thumbnail: URL(string: "https://www.example.com")!),
						nationality: "EN")
		
		return user
		
	}
}
