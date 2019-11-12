//
//  EcmViewModel.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/11/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class EcmViewModel: ObservableObject  {
    let veterencyValues1 = [Localizable.rookie(),Localizable.trained(),Localizable.hardened()]
    let veterencyValues2 = [Localizable.veteran(),Localizable.elite()]

    let ecmValues1 = ["0%","10%","20%","30%"]
    let ecmValues2 = ["40%","50%","60%"]

    var vet = 0.0
    var ecm = 100.0
    @Published var accuracy = ""
    @Published var missiles = ""
    @Published var hits = ""

    var chancesString : String {
        guard let accuracy = Double(accuracy),
        let missiles = Double(missiles),
        let hits = Double(hits)
        else { return Localizable.chancesPrefix() + "0%" }
        let hitRate = accuracy/100
            * vet
            * (1 - ecm)

        let c = round(bpAtLeast(f: missiles, h: hits, hitRate: hitRate) * 100.0);
        return Localizable.chancesPrefix() + "\((c > 100) ? 100 : c)%"
    }

    var chancesColor: Color {
        var color : UIColor? // default to white
        let chances = chancesString.split(separator: " ").last?.dropLast()
        if let c = Double(chances ?? "") {
            if c >= 50 { color = R.color.favorite() }
            else if c == 0 { color = R.color.primary()  }
            else if c < 50 { color = R.color.danger() }
        }
        return Color(color ?? UIColor.white)
    }

//    var buttonColor: Color {
//        willSet(currentName) // custom parameter name is used
//        {
//         print(" current name is about to set in property name ")
//        }
//    }

    var buttonColor: Color {
        get {
        var color : UIColor? // default to white
        if (toggled) {
            color = R.color.button()
        } else {
            color = R.color.primary()
        }
        return Color(color ?? UIColor.white)
        }
    }

    var toggled = false
    func vetClicked(veterancy: String) {
        toggled = !toggled
        vet = 0;
    }

    func ecmClicked(ecm: String) {
        toggled = !toggled
        self.ecm = 0
    }
    private func productRange(a: Double, b: Double) -> Double {
        var product = a, i = a;

        while (i<b){
            i += 1
            product*=i
        }
        return product;
    }

    private func combinations(n: Double, k: Double) -> Double {
        var i = k
        if (n==i) {
            return 1;
        } else {
            i = max(i,n-i);
            return productRange(a: i+1,b: n) / productRange(a: 1, b: n-i);
        }
    }

    private func binomProbability(f: Double, h: Double, hitRate: Double) -> Double{
        return combinations(n: f,k: h) * pow(Double(hitRate),h) * pow(1.0-hitRate,(f-h));
    }

    private func bpAtLeast(f: Double, h: Double, hitRate: Double) -> Double {
        var ret = 0.0
        let hits = Int(h)
        let fired = Int(f)
        for hits in hits ... fired {
            ret += binomProbability(f: f, h: Double(hits), hitRate: hitRate);
        }
        return ret;
    }

}
