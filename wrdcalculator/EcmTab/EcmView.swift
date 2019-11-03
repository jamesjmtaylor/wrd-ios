//
//  EcmView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/28/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI
import Rswift

struct EcmView: View {
    @ObservedObject var vm: EcmViewModel
    var body: some View {
        return VStack {
            Image("sam").scaledToFit()
            Divider()

            InputFieldView(category: Localizable.accOfAA(), input: $vm.accuracy)
            InputFieldView(category: Localizable.missilesFired(), input: $vm.missiles)
            InputFieldView(category: Localizable.desiredHits(), input: $vm.hits)
        }

    }
}

struct EcmView_Previews: PreviewProvider {
    static var previews: some View {
        EcmView(vm: EcmViewModel())
    }
}
