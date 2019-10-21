//
//  HeatViewModel.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/11/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import Foundation

class HeatViewModel {
    var ar : Double = 0
    var ap : Double = 0
    var d = ""

    func inputChanged() {
        if ar==1 {
            d = round(ap).description
        } else if ar==0 {
            d = round(ap * 2).description
        } else if (ap-ar)>=10{
            d = round(6 + ap - 10 - ar).description
        } else if ap-ar < 10 && ap - ar >= 1 {
            d = round((ap - ar)/2 + 1).description
        } else {
            d = 0.description;
        }
    }
}
