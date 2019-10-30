//
//  KeViewModel.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/11/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI
import Combine
import Rswift

class KeViewModel : ObservableObject {
    @Published var ap = ""
    @Published var targetArmor = ""
    @Published var targetRange = ""
    @Published var weaponRange = ""

    var damageColor: Color {
        var color : UIColor? // default to white
        if damageString.contains(Localizable.outOfRange())
        || damageString.contains(Localizable.inefficient()){ color =  R.color.dark() }
        if let d = Double(damageString.split(separator: " ").last ?? "") {
            if d < 10 { color = R.color.primary() }
            else { color = R.color.danger() }
        }
        return Color(color ?? UIColor.white)
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
}
