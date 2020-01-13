//import UIKit // Interface Graphique iOS
import Foundation // Contient les types Date, Data, URL, etc.

struct Contact {

    var nom: String
    var prenom: String
    var tel: String?
    var email: String?

    var salaire: Int?
    var estDisponible: Bool
    var dateNaissance: Date?

    init(nom: String, prenom: String) {
        self.nom = nom
        self.prenom = prenom
        estDisponible = false
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
let moi = Contact(nom: "Ollagnier", prenom: "Ludovic")

monAnnuaire.ajouter(moi)
monAnnuaire.ajouter(moi)
print(monAnnuaire.allContacts)

moi.email?.lowercased()
