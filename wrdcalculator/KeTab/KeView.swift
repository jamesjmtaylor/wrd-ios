//
//  KeView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/19/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct KeView: View {
    @ObservedObject var vm = KeViewModel()
    @State var ap :String = ""
    var body: some View {

        VStack {
            Image("ke")
            TextField("Weapon AP", text: $ap)
            NumberTextField(placeholderText: "Weapon AP")
            
            Text("KE View")
        }
    }
}

struct KeView_Previews: PreviewProvider {
    static var previews: some View {
        KeView()
    }
}
