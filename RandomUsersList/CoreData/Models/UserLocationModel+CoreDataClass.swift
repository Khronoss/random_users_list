//
//  UserLocationModel+CoreDataClass.swift
//  RandomUsersList
//
//  Created by Anthony Merle on 11/09/2018.
//  Copyright © 2018 Anthony Merle. All rights reserved.
//
//

import Foundation
import CoreData

//@objc(UserLocationModel)
public class UserLocationModel: NSManagedObject {
	init(fromLocation location: UserLocation,
		 in context: NSManagedObjectContext) {
		let entity = NSEntityDescription.entity(forEntityName: "UserLocationModel", in: context)
		super.init(entity: entity!,
				   insertInto: context)
		
		street = location.street
		city = location.city
		state = location.state
		postCode = location.postCode
	}
	
	public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
		super.init(entity: entity, insertInto: context)
	}

	func toUserLocation() -> UserLocation {
		let location = UserLocation(street: street!,
									city: city!,
									state: state!,
									postCode: postCode!)
		
		return location
	}
}
