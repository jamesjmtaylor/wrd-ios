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
    let veterencyValues = [Localizable.rookie(),Localizable.trained(),Localizable.hardened(),Localizable.veteran(),Localizable.elite()]
    let ecmValues = ["0%","10%","20%","30%","40%","50%","60%"]

    @Published var selectedVet = 0
    @Published var selectedEcm = 0
    @Published var accuracy = ""
    @Published var missiles = ""
    @Published var hits = ""

    private lazy var vet: () -> Double = {
        switch self.veterencyValues[self.selectedVet] {
        case Localizable.rookie(): return  1
        case Localizable.trained(): return  1.08
        case Localizable.hardened(): return 1.16
        case Localizable.veteran(): return  1.24
        case Localizable.elite(): return  1.32
        default: return  0
        }
    }

    private lazy var ecm = {
        (Double(self.ecmValues[self.selectedEcm].dropLast().description) ?? 0) / 100.0
    }

    var chancesString : String {
        guard let accuracy = Double(accuracy),
        let missiles = Double(missiles),
        let hits = Double(hits)
        else { return Localizable.chancesPrefix() + "0%" }
        let hitRate = accuracy/100
            * vet()
            * (1 - ecm())

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
        if hits > fired {return 0}
        for desiredHits in hits ... fired {
            ret += binomProbability(f: f, h: Double(desiredHits), hitRate: hitRate);
        }
        return ret
    }

}
