//
//  SearchDetailController.swift
//  Organizer
//
//  Created by Justin Lin on 8/18/17.
//  Copyright © 2017 Justin Lin. All rights reserved.
//

import UIKit

class SearchDetailController: UIViewController
{
    var person: Person!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var occupationLabel: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        nameLabel.text = person.name
        if let age = person.age {ageLabel.text = String(age)}
        else {ageLabel.text = ""}
        addressLabel.text = person.address
        occupationLabel.text = person.occupation
        phoneNumberLabel.text = person.phoneNumber
        emailLabel.text = person.email
    }
}
