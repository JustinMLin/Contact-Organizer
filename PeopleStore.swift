//
//  PeopleStore.swift
//  Organizer
//
//  Created by Justin Lin on 8/12/17.
//  Copyright © 2017 Justin Lin. All rights reserved.
//

import UIKit

class PeopleStore
{
    var people = [Person]()
    
    func addPerson(person: Person)
    {
        people.append(person)
    }
    
    func removePerson(_ person: Person)
    {
        if let index = people.index(of: person)
        {
            people.remove(at: index)
        }
    }
    
    func alphabetize() -> Void
    {
        people = people.sorted(by: {$0.name.localizedCompare($1.name) == .orderedAscending})
    }
}
