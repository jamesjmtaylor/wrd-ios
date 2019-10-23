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
    @State var ap : Int?
    var body: some View {

        return HStack(alignment:.top){
            VStack {
                Image("ke")
                VStack(alignment: .leading) {
                    Text("Weapon AP")
                    NumberTextField(numberValue: $vm.ap, placeholderText: "Weapon AP")
                    Divider()
                }.padding(.leading)

                VStack(alignment: .leading){
                    Text("Target Armor")
                    NumberTextField(numberValue: $vm.targetArmor, placeholderText: "Target Armor")
                    Divider()
                }.padding(.leading)
                VStack(alignment: .leading) {
                    Text("Weapon Max Range")
                    NumberTextField(numberValue: $vm.weaponRange, placeholderText: "Weapon Max Range")
                    Divider()
                }.padding(.leading)
                VStack(alignment: .leading){
                    Text("Range to Target")
                    NumberTextField(numberValue: $vm.targetRange, placeholderText: "Range to Target")
                    Divider()
                }.padding(.leading)
                Text(vm.damage)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.blue)
                    .frame(maxHeight: .infinity)
            }
        
        }
    }
}

struct KeView_Previews: PreviewProvider {
    static var previews: some View {
        KeView()
    }
}
