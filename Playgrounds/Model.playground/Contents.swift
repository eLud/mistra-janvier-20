//import UIKit // Interface Graphique iOS
import Foundation // Contient les types Date, Data, URL, etc.

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

let monAnnuaire = Annuaire()
let moi = Contact(nom: "Ollagnier", prenom: "Ludovic", estDispo: true)

monAnnuaire.ajouter(moi)
monAnnuaire.ajouter(moi)
print(monAnnuaire.allContacts)

moi.email?.lowercased()
