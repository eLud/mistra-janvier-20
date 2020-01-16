//
//  ContactListViewController.swift
//  Contacts
//
//  Created by Ludovic Ollagnier on 15/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var annuaire = Annuaire()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        for i in 0...10000 {
            annuaire.ajouter(Contact(nom: "Ludovic \(i)", prenom: "Ollagnier"))
        }

        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        print("Prepare for segue")
        if segue.identifier == "details" {
            // vers details
            guard let indexPathCell = tableView.indexPathForSelectedRow else {
                return
            }
            guard let ecranDetails = segue.destination as? ContactDetailsViewController else {
                return
            }

            let contact = annuaire.allContacts[indexPathCell.row]
            ecranDetails.contact = contact

        } else if segue.identifier == "form" {
            //vers formulaire

            //Faire passer l'annuaire, pour avoir un annuaire partagé
        }
    }
}

extension ContactListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return annuaire.allContacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)

//        let index = indexPath.row
//        indexPath.section

        let contact = annuaire.allContacts[indexPath.row]

        cell.textLabel?.text = contact.nom
        cell.detailTextLabel?.text = contact.prenom

        print(indexPath)
        return cell
    }
}
