//
//  ContentView.swift
//  First contact SwiftUI
//
//  Created by Ludovic Ollagnier on 14/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Text("Hello, World!")
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
            }
            Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Picker")) {
                /*@START_MENU_TOKEN@*/Text("1").tag(1)/*@END_MENU_TOKEN@*/
                /*@START_MENU_TOKEN@*/Text("2").tag(2)/*@END_MENU_TOKEN@*/
            }.pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
