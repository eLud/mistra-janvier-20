//
//  GlobalTabView.swift
//  Contacts SwiftUI
//
//  Created by Ludovic Ollagnier on 16/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import SwiftUI

struct GlobalTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                ContactListView()
            }.tabItem {
                Image(systemName: "list.dash")
                Text("Contacts")
            }
            NavigationView {
                MapView()
            }.tabItem {
                Image(systemName: "map")
                Text("World map")
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct GlobalTabView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalTabView()
    }
}
