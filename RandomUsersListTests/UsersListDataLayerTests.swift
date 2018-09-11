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
	
	func testSaveUsersList() {
		let users: [User] = [
			createRandomUser(firstname: "First", lastname: "Last"),
			createRandomUser(firstname: "Foo", lastname: "Bar")
		]
		
		dataLayer.saveUsers(users)
		
		let savedUsers = dataLayer.retrieveUsers(forPage: 0, countPerPage: 10)
		
		XCTAssertEqual(savedUsers.count, 2)
		XCTAssertEqual(savedUsers[0].name.firstname, "First")
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
