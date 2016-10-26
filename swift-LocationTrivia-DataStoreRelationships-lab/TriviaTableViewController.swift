//
//  TriviaTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Jhantelle Belleza on 10/24/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TriviaTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var location: Location = Location()
    
    @IBOutlet weak var triviaTV: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityLabel = "Trivia Table"
        view.accessibilityIdentifier = "Trivia Table"
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "Add Trivia Button"
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "Add Trivia Button"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        triviaTV.reloadData()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location.trivia.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        cell.textLabel?.text = location.trivia[indexPath.row].content
        cell.detailTextLabel?.text = String(location.trivia[indexPath.row].likes)
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if segue.identifier == "addTrivia" {
            let addTrivia = segue.destination as! AddTriviaViewController
            addTrivia.location = self.location
        //}
    }

}
