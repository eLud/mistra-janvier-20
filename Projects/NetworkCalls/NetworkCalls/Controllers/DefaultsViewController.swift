//
//  DefaultsViewController.swift
//  NetworkCalls
//
//  Created by Ludovic Ollagnier on 17/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import UIKit

class DefaultsViewController: UIViewController {

    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var reminderLabel: UILabel!

    let reminderKey = "reminder"

    override func viewDidLoad() {
        super.viewDidLoad()

        let usedDefaults = UserDefaults.standard
        if let reminder = usedDefaults.string(forKey: reminderKey) {
            reminderLabel.text = reminder
        } else {
            reminderLabel.text = "Nothing to remember…"
        }
    }

    @IBAction func remindMe(_ sender: Any) {

        let usedDefaults = UserDefaults.standard
        usedDefaults.set(noteTextField.text, forKey: reminderKey)
        reminderLabel.text = noteTextField.text
    }
}
