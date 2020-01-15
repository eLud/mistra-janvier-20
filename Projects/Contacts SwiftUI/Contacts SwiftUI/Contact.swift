//
//  Contact.swift
//  Contacts
//
//  Created by Ludovic Ollagnier on 14/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import Foundation

enum TypeContact: Int, CaseIterable, Identifiable {

    var id: TypeContact {
        return self
    }

    case pro
    case perso
    case partagé

    var title: String {
        switch self {
        case .pro:
            return "Pro"
        case .perso:
            return "Perso"
        case .partagé:
            return "Partagé"
        }
    }
}

struct Contact: Identifiable {

    var nom: String
    var prenom: String
    var tel: String?
    var email: String?

    var salaire: Int?
    var estDisponible: Bool
    var dateNaissance: Date?

    var type: TypeContact

    let id: UUID = UUID()

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
