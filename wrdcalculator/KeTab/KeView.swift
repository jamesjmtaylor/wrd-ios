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
//    @ObservedObject var vm = KeViewModel()
    @State var ap = ""
    @State var targetArmor = ""
    @State var targetRange = ""
    @State var weaponRange = ""

    let outOfRange = "Out of Range"
    let inefficient = "Inefficient"
    let damage = "Damage: "
    var damageColor: Color {
        if damageString.contains(outOfRange) { return Color.red }
        if damageString.contains(inefficient) { return Color.black }
        let d = String(damageString[damage.endIndex ..< damageString.endIndex])
        if (Int(d) ?? 0) < 10 { return Color.blue }
        return Color.red
    }


    @State var totalAmount = ""
    var damageString : String {
            guard let ap = Double(ap),
                let weaponRange = Double(weaponRange),
                let targetRange = Double(targetRange),
                let targetArmor = Double(targetArmor) else {return damage + " 0"}
            if (weaponRange < targetRange){
                return outOfRange;
            } else {
                let difference = (weaponRange - targetRange) / 175
                //print("Difference is equal to",difference)
                let actualAp = ap + difference
                //print("actual AP is equal to",actualAp)
                if (actualAp < targetArmor){
                    return inefficient
                } else if (targetArmor == 0){
                    return damage + "\(round(actualAp * 2))"
                } else {
                    return damage + " \(round((actualAp - Double(targetArmor)) / 2 + 1.0))"
                }
            }
    }

////    @State var weaponRange : Int? = nil
//    @State var targetRange : Int? = nil

    var body: some View {
        return VStack {
            Image("ke")
            InputFieldView(category: Localizable.weaponAp(), input: $ap)
                InputFieldView(category: "Target Armor", input: $targetArmor)
                InputFieldView(category: "Weapon Range", input: $weaponRange)
                InputFieldView(category: "Target Range", input: $targetRange)
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
