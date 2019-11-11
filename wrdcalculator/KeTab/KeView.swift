//
//  KeView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/19/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI
import Rswift

struct KeView: View {
    @ObservedObject var vm: KeViewModel

    var body: some View {
        return KeyboardHost {
            VStack {
            Image("ke")

            InputFieldView(category: Localizable.weaponAp(), tag: 1, input: $vm.ap)
            InputFieldView(category: Localizable.targetArmor(), tag: 2, input: $vm.targetArmor)
            InputFieldView(category: Localizable.weaponRange(), tag: 3, input: $vm.weaponRange)
            InputFieldView(category: Localizable.targetRange(), tag: 4, input: $vm.targetRange)

            Text(String(vm.damageString))
            .foregroundColor(Color.white)
            .padding()
            .background(vm.damageColor)
            .frame(maxHeight: .infinity)
            }
        }
    }
}

struct KeView_Previews: PreviewProvider {
    static var previews: some View {
        KeView(vm: KeViewModel())
    }
}
