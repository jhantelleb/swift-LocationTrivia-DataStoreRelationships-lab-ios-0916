//
//  LocationsTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Jhantelle Belleza on 10/24/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController {
    
    var store: LocationsDataStore = LocationsDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.accessibilityLabel = "Locations Table"
        tableView.accessibilityIdentifier = "Locations Table"
        
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "addButton"
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "addButton"
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  store.locations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        let locations = store.locations[indexPath.row]

        cell.textLabel?.text = locations.name
        cell.detailTextLabel?.text = String(locations.trivia.count)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showTrivia" {
        let triviaVC = segue.destination as! TriviaTableViewController
            let index = tableView.indexPathForSelectedRow?.row
            triviaVC.location = store.locations[index!]
        }
        
        if segue.identifier == "addLocation" {
//           let addLocVC = segue.destination as! AddLocationViewController
        }
    }
}

