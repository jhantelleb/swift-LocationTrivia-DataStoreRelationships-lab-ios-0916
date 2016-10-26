//
//  AddTriviaViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Jhantelle Belleza on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class AddTriviaViewController: UIViewController {
    
    
    var location = Location()
    
    @IBOutlet weak var addTriviaTextField: UITextField!
    
    @IBAction func addTriviaButton(_ sender: UIButton) {
        let trivia = Trivium()
        trivia.content = (addTriviaTextField?.text)!
        if !trivia.content.isEmpty { location.trivia.append(trivia) }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem?.accessibilityIdentifier = "Cancel Button"
        self.navigationItem.leftBarButtonItem?.accessibilityLabel = "Cancel Button"
    
    }
    
    
    
}
