//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by Ludovic Ollagnier on 16/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {

    var contact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        if let contact = contact {
            print(contact)
        } else {
            print("No contact")
        }
    }

}
