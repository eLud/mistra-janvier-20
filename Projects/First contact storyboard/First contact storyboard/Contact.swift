//
//  Contact.swift
//  First contact storyboard
//
//  Created by Ludovic Ollagnier on 14/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import Foundation

enum TypeContact {
    case pro
    case perso
    case partagé
}

struct Contact {

    var nom: String
    var prenom: String
    var tel: String?
    var email: String?

    var salaire: Int?
    var estDisponible: Bool
    var dateNaissance: Date?

    var type: TypeContact

    init(nom: String, prenom: String, estDispo: Bool = false) {
        self.nom = nom
        self.prenom = prenom
        self.estDisponible = estDispo

        type = .perso
    }

    func appeller() {
        guard let phone = tel else { return }
        //Faire l'appel
        print(phone)
    }

    func envoyerMail() {
        if let mail = email {
            //envoyer mail
            print(mail)
        } else {
            // Autre chose
        }
    }
}