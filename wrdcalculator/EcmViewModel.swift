//
//  EcmViewModel.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/11/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import Foundation
class EcmViewModel {
    var vet : Int = 0
    var ecm : Int = 100
    var acc : Int
    var missiles : Int
    var hits : Int
    var chances : Int = 0;

    func productRange(a: Int, b: Int) -> Int {
        var product = a, i = a;

        while (i++<b){
            product*=i;
        }
        return product;
    }

    func combinations(n: Int, k: Int) -> Int {
        if (n==k) {
            return 1;
        } else {
            k = Math.max(k,n-k);
            return this.productRange(k+1,n) / this.productRange(1, n-k);
        }
    }

    func binomProbability(f: Int, h: Int, hitRate: Int) -> Int{
        return this.combinations(f,h)*Math.pow(hitRate,h)*Math.pow(1.0-hitRate,(f-h));
    }

    func bpAtLeast(f: Int, h: Int, hitRate: Int) -> Int {
        var ret = 0
        var i = h
        for i in i ... f {
            ret += this.binomProbability(f,i,hitRate);
        }
        return ret;
    }

    func updateChances(){
        var fired = parseInt(this.missiles);
        var hit = parseInt(this.hits);
        var accuracy = parseInt(this.acc);
        var hitRate = (accuracy/100)
            * parseFloat(this.vet)
            * (1 - parseFloat(this.ecm));

        var c = Math.round(this.bpAtLeast(fired,hit,hitRate) * 100);
        c = (c>100) ? 100 : c;
        this.chances = c || 0;

        /*     console.log("Veterancy:",this.vet,
         "ECM:",this.ecm,
         "Accuracy:",this.acc,
         "Fired:",this.missiles,
         "Required hits:",this.hits,
         "CHANCES:",this.chances);*/
    }

    func vetClicked(veterancy: Int) {
        this.vet = veterancy;
        this.updateChances();
    }
    func ecmClicked(ecm: Int) {
        //const target = <HTMLElement> event.target;
        this.ecm = ecm;
        this.updateChances();
    }
}
