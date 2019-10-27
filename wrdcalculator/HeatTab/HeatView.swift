//
//  HeatView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/19/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct HeatView: View {
    @ObservedObject var vm = HeatViewModel()
    @State var damage = "Damage: 0"
        var body: some View {
            return VStack {
                //TextField("Test", text: $test).onReceive(<#T##publisher: Publisher##Publisher#>, perform: <#T##(Publisher.Output) -> Void#>) //TODO: Use this exampe for KeView
                Image("heat")
                VStack(alignment: .leading) {
                    Text("Weapon AP")
//                    BindableNumberTextField(numberValue: $vm.ap, placeholderText: "Weapon AP")
                    Divider()
                }.padding(.leading)
                Text("\(vm.damage)")
                .foregroundColor(Color.white)
                .padding()
                .background(Color.blue)
                .frame(maxHeight: .infinity)
//                .onReceive(vm.didChange) { _ in //TODO: This properly updates every time the VM changes, need to apply to BindableNumberTextFields.
//                    //self.now = Date()
//                }
            }
        }
}

struct HeatView_Previews: PreviewProvider {
    static var previews: some View {
        HeatView()
    }
}
