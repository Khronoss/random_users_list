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
		super.init(entity: UserLocationModel.entity(),
				   insertInto: context)
		
		street = location.street
		city = location.city
		state = location.state
		postCode = location.postCode
	}
	
	func toUserLocation() -> UserLocation {
		let location = UserLocation(street: street!,
									city: city!,
									state: state!,
									postCode: postCode!)
		
		return location
	}
}
