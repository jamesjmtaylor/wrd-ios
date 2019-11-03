//
//  EcmViewModel.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/11/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import Foundation

class EcmViewModel: ObservableObject  {
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

    func vetClicked(veterancy: Double) {
        vet = veterancy;
    }

    func ecmClicked(ecm: Double) {
        self.ecm = ecm
    }
}
