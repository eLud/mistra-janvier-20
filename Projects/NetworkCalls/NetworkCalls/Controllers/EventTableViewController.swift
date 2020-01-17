//
//  EventTableViewController.swift
//  NetworkCalls
//
//  Created by Ludovic Ollagnier on 17/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import UIKit
import SwiftyJSON

class EventTableViewController: UITableViewController {

    @IBOutlet weak var stateSegmentedControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!



    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func save(_ sender: Any) {

        let state = Event.State(rawValue: stateSegmentedControl.selectedSegmentIndex)
        let event = Event(name: nameTextField.text!, date: datePicker.date, stateOfEvent: state!)
        if let encodedEvent = try? encode(event: event) {
            postData(encodedEvent)

            if let event = decode(eventData: encodedEvent) {
                print(event)
            }
        }
    }

    @IBAction func saveToDisk(_ sender: Any) {

        let state = Event.State(rawValue: stateSegmentedControl.selectedSegmentIndex)
        let event = Event(name: nameTextField.text!, date: datePicker.date, stateOfEvent: state!)

        if let encodedEvent = try? encode(event: event) {
            saveLocally(data: encodedEvent)
        }
    }

    func encode(event: Event) throws -> Data {
        //Type soit Encodable
        //Faut un encodeur

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.keyEncodingStrategy = .convertToSnakeCase

        //Gestion des erreurs
        //1 - Do-catch
        //2 - try?
        //3 - try!
        //4 - Propager

// Do-catch example
//        do {
//            let data = try encoder.encode(event)
//            return data
//        } catch {
//            print(error)
//            return nil
//        }

// try? example
//        let data = try? encoder.encode(event)
//        return data

// try! example
//        let data = try! encoder.encode(event)
//        return data

        let data = try encoder.encode(event)
        return data
    }

        func decode(eventData: Data) -> Event? {
            //Type soit Decodable
            //Faut un decodeur

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            let event = try? decoder.decode(Event.self, from: eventData)
            return event
        }

    func postData(_ data: Data) {

        let url = URL(string: "http://httpbin.org/post")!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data

        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            guard error == nil else { return }
            guard let data = data, let dataString = String(data: data, encoding: .utf8) else { return }

            if let json = try?  JSON(data: data) {
                let name = json["form"][0]["name"].string
                print(json)
            }
        }

        task.resume()
    }

    func saveLocally(data: Data) {

        let fm = FileManager.default
        guard let baseURL = fm.urls(for: .documentDirectory, in:.userDomainMask).first else { return }

        let urlDir = baseURL.appendingPathComponent("savedData", isDirectory: true)

        let fullURL = baseURL.appendingPathComponent("savedData/lastEvent.json")

        do {
            try fm.createDirectory(at: urlDir, withIntermediateDirectories: true, attributes: nil)
            try data.write(to: fullURL)

            let retreivedData = try Data(contentsOf: fullURL)
            print(String(data: retreivedData, encoding: .utf8)!)
        } catch {
            print(error)
        }

    }
}
