//
//  ContactCellView.swift
//  Contacts SwiftUI
//
//  Created by Ludovic Ollagnier on 16/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import SwiftUI

struct ContactCellView: View {

    var contact: Contact

    var body: some View {
        HStack {
            InitialsRoundView(initials: contact.initials, font: .headline)
            VStack(alignment: .leading) {
                Text(contact.nom)
                Text(contact.prenom)
                    .font(.footnote)
            }
        }
    }

   
}

struct ContactCellView_Previews: PreviewProvider {
    static var previews: some View {
        ContactCellView(contact: Contact(nom: "Bombeur", prenom: "Jean"))
    }
}
