//
//  Person.swift
//  Organizer
//
//  Created by Justin Lin on 8/12/17.
//  Copyright © 2017 Justin Lin. All rights reserved.
//

import UIKit

class Person: NSObject
{
    var name: String
    var age: Int?
    var address: String
    var occupation: String
    var phoneNumber: String
    var email: String
    
    init(name: String)
    {
        self.name = name
        age = nil
        address = ""
        occupation = ""
        phoneNumber = ""
        email = ""
    }
    
    init(name: String, age: Int?, address: String, occupation: String, phoneNumber: String, email: String)
    {
        self.name = name
        self.age = age
        self.address = address
        self.occupation = occupation
        self.phoneNumber = phoneNumber
        self.email = email
    }
}
