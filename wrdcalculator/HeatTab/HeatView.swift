//
//  HeatView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/19/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI
import Rswift

struct HeatView: View {
    @ObservedObject var vm: HeatViewModel
    var body: some View {
        return KeyboardHost {
            VStack {
                Image("heat")
            InputFieldView(category: Localizable.weaponAp(), tag: 1, input: $vm.ap)
            InputFieldView(category: Localizable.targetArmor(), tag: 2, input: $vm.targetArmor)

            Text(String(vm.damageString))
            .foregroundColor(Color.white)
            .padding()
            .background(vm.damageColor)
            .frame(maxHeight: .infinity)
            }
        }
    }
}


struct HeatView_Previews: PreviewProvider {
    static var previews: some View {
        HeatView(vm: HeatViewModel())
    }
}

