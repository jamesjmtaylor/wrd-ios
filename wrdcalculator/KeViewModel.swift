//
//  KeViewModel.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/11/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import Foundation
class KeViewModel {
    var ap = 0.0
    var ar = 0.0
    var weaponRange : Int = 0
    var targetRange : Int = 0
    var d = ""

    func inputChanged() {
        if (weaponRange < targetRange){
            d = "Out of Range";
        } else {
            let difference = (weaponRange - targetRange) / 175
            //print("Difference is equal to",difference)
            let actualAp = ap + Double(difference)
            //print("actual AP is equal to",actualAp)
            if (actualAp < ar){
                d = "Inefficient"
            } else if (ar == 0){
                d = round(actualAp * 2).description
            } else {
                d = round((actualAp - ar) / 2 + 1.0).description
            }
        }
    }
}
