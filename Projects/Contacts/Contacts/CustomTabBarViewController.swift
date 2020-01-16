//
//  CustomTabBarViewController.swift
//  Contacts
//
//  Created by Ludovic Ollagnier on 16/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var selectedViewController: UIViewController? {
        get {
            return super.selectedViewController
        }
        set {
            super.selectedViewController = newValue
            print("Selected view controller change : \(newValue)")
        }
    }

}
