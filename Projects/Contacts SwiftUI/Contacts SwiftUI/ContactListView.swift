//
//  ContactListView.swift
//  Contacts SwiftUI
//
//  Created by Ludovic Ollagnier on 15/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import SwiftUI

struct ContactListView: View {

    @ObservedObject var annuaire: Annuaire = Annuaire()

    var body: some View {
        VStack {
            Button(action: {
                self.annuaire.ajouter(Contact(nom: "Bombeur", prenom: "Jean"))
            }) {
                Text("Tap me")
            }
            List(annuaire.allContacts) { (contact) in
                ContactCellView(contact: contact)
            }
        }
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}

struct ContactCellView: View {

    var contact: Contact

    var body: some View {
        HStack {
            Text(initials)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Circle().foregroundColor(.gray))

            VStack(alignment: .leading) {
                Text(contact.nom)
                Text(contact.prenom)
                    .font(.footnote)
            }
        }
    }

    var initials: String {
        let firstNameInitial = contact.prenom.first ?? Character("X")
        let lastNameInitial = contact.nom.first ?? Character("X")

        return "\(firstNameInitial)\(lastNameInitial)"
    }
}
