//
//  KeViewModel.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/11/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import Foundation
class KeViewModel {
    var ap : Int
    var ar : Int
    var ra : Int
    var tr : Int
    var d : Int

    func inputChanged() {
        if (parseFloat(this.ra) < parseFloat(this.tr)){
            this.d = "Out of Range";
        } else { //TODO: Add type checking on vars here.
            var difference : number =
                (parseFloat(this.ra) - parseFloat(this.tr))/175
            //console.log("Difference is equal to",difference)
            var actualAp : number = parseFloat(this.ap) + difference
            //console.log("actual AP is equal to",actualAp)
            if (actualAp < parseFloat(this.ar)){
                this.d = "Inefficient" || 0
            } else if (this.ar == 0){
                this.d = Math.round(actualAp*2) || 0
            } else {
                this.d = Math.round((actualAp
                    - parseInt(this.ar))/2+1) || 0
            }
        }
    }
}
