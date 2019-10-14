//
//  EcmViewModel.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/11/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import Foundation

class EcmViewModel {
    var vet = 0.0
    var ecm = 100.0
    var acc = 0.0
    var missiles = 0.0
    var hits = 0.0
    var chances = 0.0

    func productRange(a: Double, b: Double) -> Double {
        var product = a, i = a;

        while (i<b){
            i += 1
            product*=i
        }
        return product;
    }

    func combinations(n: Double, k: Double) -> Double {
        var i = k
        if (n==i) {
            return 1;
        } else {
            i = max(i,n-i);
            return productRange(a: i+1,b: n) / productRange(a: 1, b: n-i);
        }
    }

    func binomProbability(f: Double, h: Double, hitRate: Double) -> Double{
        return combinations(n: f,k: h) * pow(Double(hitRate),h) * pow(1.0-hitRate,(f-h));
    }

    func bpAtLeast(f: Double, h: Double, hitRate: Double) -> Double {
        var ret = 0.0
        let hits = Int(h)
        let fired = Int(f)
        for hits in hits ... fired {
            ret += binomProbability(f: f, h: Double(hits), hitRate: hitRate);
        }
        return ret;
    }

    func updateChances(){
        let hitRate = acc/100
            * vet
            * (1 - ecm)

        let c = round(bpAtLeast(f: missiles, h: hits, hitRate: hitRate) * 100.0);
        chances = (c > 100) ? 100 : c

        /*     console.log("Veterancy:",this.vet,
         "ECM:",this.ecm,
         "Accuracy:",this.acc,
         "Fired:",this.missiles,
         "Required hits:",this.hits,
         "CHANCES:",this.chances);*/
    }

    func vetClicked(veterancy: Double) {
        vet = veterancy;
        updateChances();
    }
    func ecmClicked(ecm: Double) {
        self.ecm = ecm
        updateChances();
    }
}
