//
//  SearchResultsController.swift
//  Organizer
//
//  Created by Justin Lin on 8/18/17.
//  Copyright © 2017 Justin Lin. All rights reserved.
//

import UIKit

class SearchResultsController: UITableViewController
{
    var searchResults = [Person]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for: indexPath) as! PersonCell
        
        let person = searchResults[indexPath.row]
        
        cell.nameLabel.text = person.name
        
        return cell
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
        
        searchResults = searchResults.sorted(by: {$0.name.localizedCompare($1.name) == .orderedAscending})
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        switch segue.identifier
        {
        case "searchDetail"?:
            if let row = tableView.indexPathForSelectedRow?.row
            {
                let person = searchResults[row]
                let searchDetailController = segue.destination as! SearchDetailController
                searchDetailController.person = person
                
                let backItem = UIBarButtonItem()
                backItem.title = "Search Results"
                navigationItem.backBarButtonItem = backItem
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }
}
