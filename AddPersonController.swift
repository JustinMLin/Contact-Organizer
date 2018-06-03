//
//  PersonDetailController.swift
//  Organizer
//
//  Created by Justin Lin on 8/14/17.
//  Copyright © 2017 Justin Lin. All rights reserved.
//

import UIKit

class AddPersonController: UIViewController
{
    var peopleStore: PeopleStore!
    var done = false
    
    
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
    
    @IBAction func done(_ sender: UIBarButtonItem)
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
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        if done == true
        {
            let name = nameField.text ?? ""
            let age = Int(ageField.text ?? "")
            let address = addressField.text ?? ""
            let occupation = occupationField.text ?? ""
            let phoneNumber = phoneNumberField.text ?? ""
            let email = emailField.text ?? ""
            let person = Person(name: name, age: age, address: address, occupation: occupation, phoneNumber: phoneNumber, email: email)
        
            peopleStore.addPerson(person: person)
        }
    }
}

