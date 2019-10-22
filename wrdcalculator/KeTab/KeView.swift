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
                    NumberTextField(numberValue: ap, placeholderText: "Weapon AP")
                    Divider()
                }.padding(.leading)

                VStack(alignment: .leading){
                    Text("Target Armor")
                    NumberTextField(numberValue: ap, placeholderText: "Target Armor")
                    Divider()
                }.padding(.leading)
                VStack(alignment: .leading) {
                    Text("Weapon Max Range")
                    NumberTextField(numberValue: ap, placeholderText: "Weapon Max Range")
                    Divider()
                }.padding(.leading)
                VStack(alignment: .leading){
                    Text("Range to Target")
                    NumberTextField(numberValue: ap, placeholderText: "Range to Target")
                    Divider()
                }.padding(.leading)
                Text("Damage: 0")
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
