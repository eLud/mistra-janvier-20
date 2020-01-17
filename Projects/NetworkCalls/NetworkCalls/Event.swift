//
//  Event.swift
//  NetworkCalls
//
//  Created by Ludovic Ollagnier on 17/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import Foundation

struct Event: Codable {

    enum State: Int, Codable {
        case open
        case full
        case cancelled
    }
    
    let name: String
    let date: Date
    var stateOfEvent: State

    //Lien entre nom Swift et nom JSON
    enum CodingKeys: String, CodingKey {
        case name
        case date = "dh"
        case stateOfEvent
    }
}
