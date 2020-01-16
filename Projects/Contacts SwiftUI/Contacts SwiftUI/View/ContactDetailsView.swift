//
//  ContactDetailsView.swift
//  Contacts SwiftUI
//
//  Created by Ludovic Ollagnier on 16/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import SwiftUI

struct ContactDetailsView: View {

    var contact: Contact

    var body: some View {
        VStack {
            InitialsRoundView(initials: contact.initials, font: .system(size: 90))
            HStack {
                Text(contact.prenom)
                Text(contact.nom)
            }.font(.title)
            Spacer()
        }
    }
}

struct ContactDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailsView(contact: Contact(nom: "Bombeur", prenom: "Jean"))
    }
}
