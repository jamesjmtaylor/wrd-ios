//
//  HeatViewModel.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/11/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class HeatViewModel: ObservableObject  {
    @Published var ap = ""
    @Published var targetArmor = ""

    var damageString : String {
            guard let ap = Double(ap),
                let targetArmor = Double(targetArmor) else {
                    return Localizable.damagePrefix() + " 0"
        }
        if targetArmor==1 {
            return Localizable.damagePrefix()
            +  ap.description
        } else if targetArmor==0 {
            return Localizable.damagePrefix()
            + (ap * 2).description
        } else if (ap-targetArmor)>=10{
            return Localizable.damagePrefix()
            + (6 + ap - 10 - targetArmor).description
        } else if ap-targetArmor < 10 && ap - targetArmor >= 1 {
            return Localizable.damagePrefix()
            +  round(Double(ap - targetArmor)/2 + 1).description
        } else {
            return Localizable.damagePrefix()
            +  0.description;
        }
    }

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
}
