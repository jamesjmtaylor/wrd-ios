//
//  HeatView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/19/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct HeatView: View {
    @State var test = "Test"
    var body: some View {
        VStack {
        Text("Heat View")
        TextField("Test", text: $test) //TODO: Use this exampe for KeView
        }
    }
}

struct HeatView_Previews: PreviewProvider {
    static var previews: some View {
        HeatView()
    }
}
