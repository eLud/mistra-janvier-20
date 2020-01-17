//
//  ViewController.swift
//  Image Capture
//
//  Created by Ludovic Ollagnier on 17/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        cameraButton.layer.cornerRadius = 50
    }

    @IBAction func takePhoto(_ sender: Any) {

        let controller = UIImagePickerController()

        controller.sourceType = .camera
        controller.cameraCaptureMode = .photo
        controller.cameraDevice = .front

        controller.delegate = self

        present(controller, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[.originalImage] as? UIImage {
            imageView.image = image

//            let jpg = image.jpegData(compressionQuality: 0.8)
        }

        dismiss(animated: true, completion: nil)
    }
}
