//
//  ContactView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/28/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct ContactView: View {
    @State private var text = ""
    var body: some View {
        ScrollView{
        VStack(alignment: .leading) {
            Text("Test")
            TextField("Test", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)

            Divider()
        }.padding(.leading)
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
