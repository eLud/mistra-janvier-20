//
//  ViewController.swift
//  Contacts
//
//  Created by Ludovic Ollagnier on 14/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var salaryTextField: UITextField!

    @IBOutlet weak var dispoSwitch: UISwitch!
    @IBOutlet weak var birthDatePicker: UIDatePicker!

    var annuaire: Annuaire?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        configureType()

        birthDatePicker.maximumDate = Date()
    }

    private func configureType() {
        typeSegmentedControl.removeAllSegments()
        for cas in TypeContact.allCases {
            typeSegmentedControl.insertSegment(withTitle: cas.title, at: cas.rawValue, animated: true)
        }
        typeSegmentedControl.selectedSegmentIndex = 1
    }


    @IBAction func save(_ sender: Any) {

        guard let nom = nameTextField.text, nom.count > 2 else { return }
        guard let prenom = firstNameTextField.text, prenom.count > 2 else { return }
        var contact = Contact(nom: nom, prenom: prenom, estDispo: dispoSwitch
            .isOn)

        let indexType = typeSegmentedControl.selectedSegmentIndex
        if let type = TypeContact(rawValue: indexType) {
            contact.type = type
        }

        contact.tel = phoneTextField.text
        contact.email = emailtextField.text
        if let salary = salaryTextField.text, let salaryInt = Int(salary) {
            contact.salaire = salaryInt
        }

        annuaire?.ajouter(contact)
//        dismiss(animated: true, completion: nil)
    }
}

