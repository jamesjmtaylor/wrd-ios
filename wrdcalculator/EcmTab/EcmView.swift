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
                    VStack {
                        Image("sam").aspectRatio(contentMode: .fit)

                    VStack(alignment: .leading) {
                    Text(Localizable.vetOfAA()).padding(.leading)
                    Picker(Localizable.vetOfAA(),selection: $vm.selectedVet) {
                        ForEach(0 ..< self.vm.veterencyValues.count) {
                            Text(self.vm.veterencyValues[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    Text(Localizable.ecmAttackedAircraft()).padding(.leading)
                        Picker(Localizable.ecmAttackedAircraft(),selection: $vm.selectedEcm) {
                            ForEach(0 ..< self.vm.ecmValues.count) {
                                Text(self.vm.ecmValues[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                        }
                    InputFieldView(category: Localizable.accOfAA(), tag: 1, input: $vm.accuracy)
                    InputFieldView(category: Localizable.missilesFired(), tag: 2, input: $vm.missiles)
                    InputFieldView(category: Localizable.desiredHits(), tag: 3, input: $vm.hits)
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
