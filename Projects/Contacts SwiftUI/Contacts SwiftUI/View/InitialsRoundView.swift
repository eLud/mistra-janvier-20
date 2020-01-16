//
//  InitialsRoundView.swift
//  Contacts SwiftUI
//
//  Created by Ludovic Ollagnier on 16/01/2020.
//  Copyright © 2020 Tectec. All rights reserved.
//

import SwiftUI

struct InitialsRoundView: View {

    var initials: String
    var font: Font

    var body: some View {
        Text(initials)
        .font(font)
        .foregroundColor(.white)
        .padding()
        .background(Circle().foregroundColor(.gray))
    }
}

struct InitialsRoundView_Previews: PreviewProvider {
    static var previews: some View {
        InitialsRoundView(initials: "LO", font: .headline)
    }
}
