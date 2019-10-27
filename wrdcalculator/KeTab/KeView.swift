//
//  KeView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/19/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct KeView: View {
//    @ObservedObject var vm = KeViewModel()
    @State var ap = ""
    @State var targetArmor = ""


    @State var totalAmount = ""
    let addAmount = 10.0 // or whatever
    var calc : Double { (Double(ap) ?? 0.0) + (Double(targetArmor) ?? 0.0)  } // or whatever

////    @State var weaponRange : Int? = nil
//    @State var targetRange : Int? = nil

    var body: some View {
        return VStack {
                Image("ke")
                VStack(alignment: .leading) {
                    Text("Weapon AP")
                    TextField("Weapon AP", text: $ap)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width:150)


                    Divider()
                }.padding(.leading)

                VStack(alignment: .leading){
                    Text("Target Armor")
                    TextField("Target Armor", text: $targetArmor)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:150)
                    Divider()
                }.padding(.leading)
//                VStack(alignment: .leading) {
//                    Text("Weapon Max Range")
//                    BindableNumberTextField(numberValue: $weaponRange, placeholderText: "Weapon Max Range")
//                    Divider()
//                }.padding(.leading)
//                VStack(alignment: .leading){
//                    Text("Range to Target")
//                    BindableNumberTextField(numberValue: $targetRange, placeholderText: "Range to Target")
//                    Divider()
//                }.padding(.leading)
            Text(String(self.calc))
//            Text(vm.damage)
//                    .foregroundColor(Color.white)
//                    .padding()
//                    .background(Color.blue)
//                    .frame(maxHeight: .infinity)
//            }
        }
    }
}


struct KeView_Previews: PreviewProvider {
    static var previews: some View {
        KeView()
    }
}
