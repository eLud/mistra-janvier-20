//
//  ViewController.swift
//  NetworkCalls
//
//  Created by Ludovic Ollagnier on 16/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activitIndicator: UIActivityIndicatorView!

    let imageURL = URL(string: "https://www.queppelin.com/wp-content/uploads/2019/06/swift-ui-eyecatch-1024x538.png")!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getImage(_ sender: Any) {

        let session = URLSession.shared
        let task = session.dataTask(with: imageURL) { (data, response, error) in

            defer {
                DispatchQueue.main.async {
                    self.activitIndicator.stopAnimating()
                }
            }

            guard error == nil else { return }
            guard let data = data, let image = UIImage(data: data) else { return }

            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }

        activitIndicator.startAnimating()
        task.resume()
    }

    @IBAction func postData(_ sender: Any) {

        let url = URL(string: "http://httpbin.org/post")!

        let session = URLSession.shared

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Ludovic", forHTTPHeaderField: "name")
        let body = "TestBody"
        request.httpBody = body.data(using: .utf8)

        let task = session.dataTask(with: request) { (data, response, error) in

            guard error == nil else { return }
            guard let data = data, let dataString = String(data: data, encoding: .utf8) else { return }

            DispatchQueue.main.async {
                self.textView.text = dataString
            }
        }

        task.resume()
    }

}

