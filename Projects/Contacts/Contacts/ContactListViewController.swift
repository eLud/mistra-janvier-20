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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        tableView.dataSource = self
    }
}

extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)

        cell.textLabel?.text = "Démo"
        
        return cell
    }


}
