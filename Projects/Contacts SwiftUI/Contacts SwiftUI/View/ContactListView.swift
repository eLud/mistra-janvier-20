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
    @State private var addContact = false

    var body: some View {
        List(annuaire.allContacts) { (contact) in
            NavigationLink(destination: ContactDetailsView(contact: contact)) {
                ContactCellView(contact: contact)
            }
        }
        .navigationBarTitle("Contacts")
        .navigationBarItems(trailing: Button(action: {
            self.addContact = true
        }, label: {
            Image(systemName: "plus")
                .resizable()
                .frame(width: 20, height: 20)
        }))
            .sheet(isPresented: $addContact) {
                AddContactView()
        }
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContactListView()
        }
    }
}
