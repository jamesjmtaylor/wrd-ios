//
//  EcmView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/28/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct EcmView: View {
    @EnvironmentObject var vm: EcmViewModel
    var body: some View {
        return VStack {
            Image("Ecm")
            Divider()

            //InputFieldView(category: Localizable.accOfAA()(), input: $vm.targetArmor)
            //InputFieldView(category: Localizable.missilesFired(), input: $vm.targetArmor)
            //InputFieldView(category: Localizable.desiredHits(), input: $vm.targetArmor)
        }

    }
}

struct EcmView_Previews: PreviewProvider {
    static var previews: some View {
        EcmView()
    }
}
