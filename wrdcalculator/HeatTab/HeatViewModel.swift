//
//  HeatViewModel.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/11/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import Foundation
import Combine

class HeatViewModel: ObservableObject  {
    var ap : Int? { didSet {inputChanged()}}
    var targetArmor : Int? { didSet {inputChanged()}}
    var weaponRange : Int? { didSet {inputChanged()}}
    var targetRange : Int? { didSet {inputChanged()}}
    var damage = ""
    let didChange = PassthroughSubject<HeatViewModel, Never>()

    func inputChanged() {
        didChange.send(self)//TODO: Figure out how to update fields based off of this.
        guard let ap = ap,
        let weaponRange = weaponRange,
        let targetRange = targetRange,
        let targetArmor = targetArmor else {return}
        if (weaponRange < targetRange){
        if targetArmor==1 {
            damage = ap.description
        } else if targetArmor==0 {
            damage = (ap * 2).description
        } else if (ap-targetArmor)>=10{
            damage = (6 + ap - 10 - targetArmor).description
        } else if ap-targetArmor < 10 && ap - targetArmor >= 1 {
            damage = round(Double(ap - targetArmor)/2 + 1).description
        } else {
            damage = 0.description;
        }
    }
    }
}
