//
//  InputFieldView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/27/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct InputFieldView: View {
    private var category : String
    var input: Binding<String>
    init(category: String, input: Binding<String>) {
        self.category = category
        self.input = input
    }
    var body: some View {
        return VStack(alignment: .leading) {
            Text(category)
            TextField(category, text: input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding(.trailing)
            Divider()
        }.padding(.leading)
    }
}

struct InputFieldView_Previews: PreviewProvider {
    @State static private var input = ""
    static var previews: some View {
        InputFieldView(category: "Category", input: $input)
    }
}
