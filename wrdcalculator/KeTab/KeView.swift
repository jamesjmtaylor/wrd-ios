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
    @State var selectedTag: Int? = nil

    var body: some View {
        return KeyboardHost {
            VStack {
            Image("ke")
//TODO: Pass in 'selectedTag' to InputFieldView to make fields focus themselves.
            InputFieldView(category: Localizable.weaponAp(), input: $vm.ap).tag(0)
                InputFieldView(category: Localizable.targetArmor(), input: $vm.targetArmor).tag(1)
            InputFieldView(category: Localizable.weaponRange(), input: $vm.weaponRange).tag(2)
            InputFieldView(category: Localizable.targetRange(), input: $vm.targetRange).tag(3)
            //TODO: Get 'PREVIOUS`, 'NEXT' & 'DONE' to work (other than dismiss)

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
