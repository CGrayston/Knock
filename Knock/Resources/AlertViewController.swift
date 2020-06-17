//
//  AlertViewController.swift
//  Knock
//
//  Created by Christopher Grayston on 6/13/20.
//  Copyright © 2020 Christopher Grayston. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var categoryTypeSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    fileprivate func setupViews() {
        overrideUserInterfaceStyle = .light
        
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        
        cancelButton.layer.cornerRadius = 5
        cancelButton.layer.masksToBounds = true
        
        saveButton.layer.cornerRadius = 5
        saveButton.layer.masksToBounds = true
    }

    // MARK: - Helper Methods
    func createAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(okAction)
        
        present(alertVC, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Actions
    @IBAction func categoryNameInfoButtonTapped(_ sender: Any) {
        let title = "Category Name"
        let message = "\nThe name of something you are tracking for correlation\n(e.g. Doors, Interactions, Pitches, Sales, etc)"
        
        createAlert(title: title, message: message)
    }
    
    @IBAction func categoryTypeInfoButtonTapped(_ sender: Any) {
        let title = "Category Type"
        let message = "\nWork categories are for tracking after each interaction \n(e.g. Doors Knocked, Interactions, Homeowners, Pitches, etc)\n\nResult Categories are for the production from your work \n(e.g. Accounts Created, Welcome Calls, Credits Run, Sales, etc)"
        
        createAlert(title: title, message: message)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        // TODO -
        // Check to see if category name is already in use or empty
            // Pass back category name and type to HomePage create new category
        
            // Else alert user of error
        
    }
}
