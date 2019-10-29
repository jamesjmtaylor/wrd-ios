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
    @State var ap = ""
    @State var targetArmor = ""
    @State var targetRange = ""
    @State var weaponRange = ""

    var damageColor: Color {
        if damageString.contains(Localizable.outOfRange()) { return Color.red }
        if damageString.contains(Localizable.inefficient()) { return Color.black }
        let d = damageString.split(separator: " ").last ?? ""
        if (Double(d) ?? 0) < 10 { return Color.blue }
        return Color.red
    }

    var damageString : String {
            guard let ap = Double(ap),
                let weaponRange = Double(weaponRange),
                let targetRange = Double(targetRange),
                let targetArmor = Double(targetArmor) else {
                    return Localizable.damagePrefix() + " 0"
        }
            if (weaponRange < targetRange){
                return Localizable.outOfRange()
            } else {
                let difference = (weaponRange - targetRange) / 175
                //print("Difference is equal to",difference)
                let actualAp = ap + difference
                //print("actual AP is equal to",actualAp)
                if (actualAp < targetArmor){
                    return Localizable.inefficient()
                } else if (targetArmor == 0){
                    return Localizable.damagePrefix()
                        + "\(round(actualAp * 2))"
                } else {
                    return Localizable.damagePrefix()
                        + " \(round((actualAp - Double(targetArmor)) / 2 + 1.0))"
                }
            }
    }

    var body: some View {
        return VStack {
            Image("ke")
            InputFieldView(category: Localizable.weaponAp(), input: $ap)
            InputFieldView(category: Localizable.targetArmor(), input: $targetArmor)
            InputFieldView(category: Localizable.weaponRange(), input: $weaponRange)
            InputFieldView(category: Localizable.targetRange(), input: $targetRange)
            Text(String(self.damageString))
            .foregroundColor(Color.white)
            .padding()
            .background(damageColor)
            .frame(maxHeight: .infinity)
        }
    }
}


struct KeView_Previews: PreviewProvider {
    static var previews: some View {
        KeView()
    }
}
