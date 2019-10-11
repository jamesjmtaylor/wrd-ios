//
//  HeatViewModel.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/11/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import Foundation

class HeatViewModel {
    var ar : Int
    var ap : Int
    var d : Int

    func inputChanged() {
        if (parseFloat(this.ar)==1){
            this.d = Math.round(parseFloat(this.ap)) || 0;
        } else if (parseFloat(this.ar)===0){
            this.d = Math.round(parseFloat(this.ap)*2) || 0;
        } else if (parseFloat(this.ap)-parseFloat(this.ar)>=10){
            this.d = Math.round(
                6+parseFloat(this.ap)-10-parseFloat(this.ar)) || 0;
        } else if (parseFloat(this.ap)-parseFloat(this.ar)<10 &&
            parseFloat(this.ap)-parseFloat(this.ar)>=1){
            this.d = Math.round(
                (parseFloat(this.ap)-parseFloat(this.ar))/2 + 1) || 0;
        } else {
            this.d = 0;
        }
    }
}
