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
                return KeyboardHost {
                    ScrollView {
                        Image("sam").aspectRatio(contentMode: .fit)

                    InputFieldView(category: Localizable.accOfAA(), tag: 1, input: $vm.accuracy)
                    InputFieldView(category: Localizable.missilesFired(), tag: 2, input: $vm.missiles)
                    InputFieldView(category: Localizable.desiredHits(), tag: 3, input: $vm.hits)
VStack {
                        Text("Veterency of AA")

                    HStack{
                    ForEach(vm.veterencyValues1, id: \.self) {
                        Button("\($0)", action: {})
                            .frame(maxWidth: .infinity)
                        .padding()
                            .background(self.vm.buttonColor)
                        .foregroundColor(.black)
                        .cornerRadius(5)

                    }}.padding()
                    HStack{
                        ForEach(vm.veterencyValues2, id: \.self) {
                        Button("\($0)", action: {})
                            .frame(maxWidth: .infinity)
                        .padding()
                         .background(self.vm.buttonColor)
                        .foregroundColor(.black)
                        .cornerRadius(5)
                        }}.padding(.leading).padding(.trailing)
    Divider()
    Text("ECM of Aircraft")
                    HStack{
                    ForEach(vm.ecmValues1, id: \.self) {
                        Button("\($0)", action: {})
                            .frame(maxWidth: .infinity)
                        .padding()
                        .background(self.vm.buttonColor)
                        .foregroundColor(.black)
                        .cornerRadius(5)
                    }}.padding()
                    HStack{
                    ForEach(vm.ecmValues2, id: \.self) {
                        Button("\($0)", action: {})
                            .frame(maxWidth: .infinity)
                        .padding()
                            .background(self.vm.buttonColor)
                        .foregroundColor(.black)
                        .cornerRadius(5)
                        }}.padding(.leading).padding(.trailing)

    Divider()}

                    Text(String(vm.chancesString))
                    .foregroundColor(Color.white)
                    .padding()
                    .background(vm.chancesColor)
                    .frame(maxHeight: .infinity)
}
                }

    }

    }


struct EcmView_Previews: PreviewProvider {
    static var previews: some View {
        EcmView(vm: EcmViewModel())
    }
}
