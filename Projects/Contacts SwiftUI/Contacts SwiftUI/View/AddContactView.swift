//
//  ContentView.swift
//  Contacts SwiftUI
//
//  Created by Ludovic Ollagnier on 14/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import SwiftUI

struct AddContactView: View {

    @State private var nom: String = ""
    @State private var prenom: String = ""
    @State private var telephone: String = ""
    @State private var email: String = ""
    @State private var salary: String = ""

    @State private var estDispo: Bool = true
    @State private var birthDate: Date = Date()

    @State private var type: TypeContact = .perso

    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $type, label: Text("Type de contact")) {
                    ForEach(TypeContact.allCases) { type in
                        Text(type.title).tag(type)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                Section {
                    TextField("Nom", text: $nom)
                    TextField("Prenom", text: $prenom)
                    DatePicker(selection: $birthDate, displayedComponents: DatePickerComponents.date) {
                         Text("Date de naissance")
                     }
                }
                Section {             TextField("Telephone", text: $telephone)
                    TextField("Email", text: $email)
                    Toggle(isOn: $estDispo) {
                         Text("Est Dispo")
                     }
                }
                Section {
                    TextField("Salaire", text: $salary)
                }
                Section {
                    Button(action: {

                        let contact = Contact(nom: self.nom, prenom: self.prenom)
                        print(contact)

                    }) {
                        Text("Save")
                    }.background(/*@START_MENU_TOKEN@*/Color("testColor")/*@END_MENU_TOKEN@*/)
                }

            }

        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}
