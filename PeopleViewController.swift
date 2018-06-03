//
//  PeopleViewController].swift
//  Organizer
//
//  Created by Justin Lin on 8/12/17.
//  Copyright © 2017 Justin Lin. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController
{
    var peopleStore: PeopleStore!
    
    @IBAction func toggleEditingMode(_ sender: UIBarButtonItem)
    {
        if isEditing {setEditing(false, animated: true)}
        else {setEditing(true, animated: true)}
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return peopleStore.people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        peopleStore.alphabetize()
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonCell
        
        let person = peopleStore.people[indexPath.row]
        
        cell.nameLabel.text = person.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            let person = peopleStore.people[indexPath.row]
            
            let title = "Remove \(person.name)?"
            let message = "Are you sure you want to remove this person?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Remove", style: .destructive, handler:
            { (action) -> Void in
                self.peopleStore.removePerson(person)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        peopleStore.alphabetize()
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        setEditing(false, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        switch segue.identifier
        {
        case "addPerson"?:
            let addPersonController = segue.destination as! AddPersonController
            addPersonController.peopleStore = peopleStore
            
            let backItem = UIBarButtonItem()
            backItem.title = "Cancel"
            navigationItem.backBarButtonItem = backItem
        case "showDetail"?:
            if let row = tableView.indexPathForSelectedRow?.row
            {
                let person = peopleStore.people[row]
                let personDetailController = segue.destination as! PersonDetailController
                personDetailController.person = person
                
                let backItem = UIBarButtonItem()
                backItem.title = "Cancel"
                navigationItem.backBarButtonItem = backItem
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
}
