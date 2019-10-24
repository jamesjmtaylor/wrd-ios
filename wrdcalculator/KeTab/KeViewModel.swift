//
//  KeViewModel.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/11/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI
import Combine

class KeViewModel: ObservableObject {
    var ap : Int? { didSet {inputChanged()}}
    var targetArmor  : Int? { didSet {inputChanged()}}
    var weaponRange  : Int? { didSet {inputChanged()}}
    var targetRange  : Int? { didSet {inputChanged()}}
    var damage = "Damage: 0"
    let didChange = PassthroughSubject<KeViewModel, Never>()

    func inputChanged() {
        guard let ap = ap,
            let weaponRange = weaponRange,
            let targetRange = targetRange, let targetArmor = targetArmor else {return}
        if (weaponRange < targetRange){
            damage = "Out of Range";
        } else {
            let difference = Double(weaponRange - targetRange) / 175
            //print("Difference is equal to",difference)
            let actualAp = Double(ap) + difference
            //print("actual AP is equal to",actualAp)
            if (actualAp < Double(targetArmor)){
                damage = "Inefficient"
            } else if (targetArmor == 0){
                damage = "Damage: \(round(actualAp * 2))"
            } else {
                damage = "Damage: \(round((actualAp - Double(targetArmor)) / 2 + 1.0))"
            }
        }
    }
}
