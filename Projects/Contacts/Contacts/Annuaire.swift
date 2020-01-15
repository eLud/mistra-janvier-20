//
//  Annuaire.swift
//  Contacts
//
//  Created by Ludovic Ollagnier on 15/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import Foundation

class Annuaire {

    private var contacts: [Contact]

    init() {
        contacts = []
    }

    func ajouter(_ newContact: Contact) {
        contacts.append(newContact)
    }

    //propriété calculée (get only), return automatique car 1 seule ligne
    var allContacts: [Contact] { contacts }
}
