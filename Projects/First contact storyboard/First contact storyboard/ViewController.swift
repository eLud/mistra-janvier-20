//
//  ViewController.swift
//  First contact storyboard
//
//  Created by Ludovic Ollagnier on 14/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        helloLabel.text = ""
    }

    @IBAction func sayHello(_ sender: Any) {
        helloLabel.text = nameTextField.text
    }
}

