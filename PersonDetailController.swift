//
//  PersonDetailController.swift
//  Organizer
//
//  Created by Justin Lin on 8/17/17.
//  Copyright © 2017 Justin Lin. All rights reserved.
//

import UIKit

class PersonDetailController: UIViewController
{
    var done = false
    var person: Person!
    {
        didSet {navigationItem.title = person.name}
    }
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var ageField: UITextField!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var occupationField: UITextField!
    @IBOutlet var phoneNumberField: UITextField!
    @IBOutlet var emailField: UITextField!
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
    
    @IBAction func doneEditing(_ sender: UIButton)
    {
        if nameField.text == ""
        {
            let alert = UIAlertController(title: "No Name", message: "Must enter a name.", preferredStyle: .alert)
            let OKaction = UIAlertAction(title: "Ok", style: .default, handler:nil)
            alert.addAction(OKaction)
            present(alert, animated: true, completion: nil)
        }
        else
        {
            done = true
            _ = navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        nameField.text = person.name
        if let age = person.age {ageField.text = String(age)}
        addressField.text = person.address
        occupationField.text = person.occupation
        phoneNumberField.text = person.phoneNumber
        emailField.text = person.email
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        if done == true
        {
            person.name = nameField.text!
            person.age = Int(ageField.text!)
            person.address = addressField.text!
            person.occupation = occupationField.text!
            person.phoneNumber = phoneNumberField.text!
            person.email = emailField.text!
        }
    }
}
