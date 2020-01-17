//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Ludovic Ollagnier on 17/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var isAvailableSwitch: UISwitch!
    @IBOutlet weak var newCompanyTextField: UITextField!
    @IBOutlet weak var companyPicker: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        companyPicker.dataSource = self
        companyPicker.delegate = self

        tableView.dataSource = self
    }

    @IBAction func saveContact(_ sender: Any) {

        let contact = Contact(context: context)
        contact.firstName = firstNameTextField.text
        contact.lastName = lastNameTextField.text
        contact.mail = emailTextField.text
        contact.isAvailable = isAvailableSwitch.isOn

        let selectedCompanyIndex = companyPicker.selectedRow(inComponent: 0)
        let selectedCompany = companies[selectedCompanyIndex]

        contact.company = selectedCompany

        try? context.save()

        tableView.reloadData()
    }

    @IBAction func saveCompany(_ sender: Any) {

        if let companyName = newCompanyTextField.text {
            let newCompany = Company(context: context)
            newCompany.name = companyName
            try? context.save()
            companyPicker.reloadAllComponents()
        }
    }

    var companies: [Company] {
        let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
        let sort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        let results = try? context.fetch(fetchRequest)
        return results ?? []
    }

    var contacts: [Contact] {
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        let sort = NSSortDescriptor(key: "lastName", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        let results = try? context.fetch(fetchRequest)
        return results ?? []
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return companies.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return companies[row].name
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)

        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.lastName! + " " + contact.firstName!
        cell.detailTextLabel?.text = contact.company?.name

        return cell
    }
}
