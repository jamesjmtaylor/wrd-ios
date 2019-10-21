//
//  KeViewModel.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/11/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

class KeViewModel: ObservableObject {
    var ap = 0.0
    var targetArmor = 0.0
    var weaponRange : Int = 0
    var targetRange : Int = 0
    @Published var damage = ""

    func inputChanged() {
        if (weaponRange < targetRange){
            damage = "Out of Range";
        } else {
            let difference = (weaponRange - targetRange) / 175
            //print("Difference is equal to",difference)
            let actualAp = ap + Double(difference)
            //print("actual AP is equal to",actualAp)
            if (actualAp < targetArmor){
                damage = "Inefficient"
            } else if (targetArmor == 0){
                damage = round(actualAp * 2).description
            } else {
                damage = round((actualAp - targetArmor) / 2 + 1.0).description
            }
        }
    }
}
