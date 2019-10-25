//
//  KeView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/19/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct KeView: View {
    @ObservedObject var vm = KeViewModel()
    @State var now = Date()

    var body: some View {

        return HStack(alignment:.top){
            VStack {
                Image("ke")
                VStack(alignment: .leading) {
                    Text("Weapon AP")
                    BindableNumberTextField(numberValue: $vm.ap, placeholderText: "Weapon AP")
                    Divider()
                }.padding(.leading)

                VStack(alignment: .leading){
                    Text("Target Armor")
                    BindableNumberTextField(numberValue: $vm.targetArmor, placeholderText: "Target Armor")
                    Divider()
                }.padding(.leading)
                VStack(alignment: .leading) {
                    Text("Weapon Max Range")
                    BindableNumberTextField(numberValue: $vm.weaponRange, placeholderText: "Weapon Max Range")
                    Divider()
                }.padding(.leading)
                VStack(alignment: .leading){
                    Text("Range to Target")
                    BindableNumberTextField(numberValue: $vm.targetRange, placeholderText: "Range to Target")
                    Divider()
                }.padding(.leading)
                Text("\(now)")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.blue)
                    .frame(maxHeight: .infinity)
                    .onReceive(vm.didChange) { _ in //TODO: This properly updates every time the VM changes, need to apply to BindableNumberTextFields.
                        self.now = Date()
                }
            }
        
        }
    }
}

struct KeView_Previews: PreviewProvider {
    static var previews: some View {
        KeView()
    }
}
