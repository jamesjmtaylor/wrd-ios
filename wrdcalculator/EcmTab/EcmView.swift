//
//  EcmView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/28/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI
import Rswift

struct ListButton: Identifiable {
    var id = UUID()
    var title: String
}

struct EcmView: View {
    @ObservedObject var vm: EcmViewModel


    var body: some View {
        return VStack {
            Image("sam")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.trailing,16)
            //TODO: See for creating buttons from an array https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-views-in-a-loop-using-foreach
            ForEach((1...10), id: \.self) {
                Text("\($0)")
            }
            Divider()

//            InputFieldView(category: Localizable.accOfAA(), input: $vm.accuracy)
//            InputFieldView(category: Localizable.missilesFired(), input: $vm.missiles)
//            InputFieldView(category: Localizable.desiredHits(), input: $vm.hits)
        }

    }
}

struct EcmView_Previews: PreviewProvider {
    static var previews: some View {
        EcmView(vm: EcmViewModel())
    }
}
