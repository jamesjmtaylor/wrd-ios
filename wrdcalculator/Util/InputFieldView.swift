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
    var tag: Int
    var input: Binding<String>
    init(category: String, tag: Int, input: Binding<String>) {
        self.category = category
        self.tag = tag
        self.input = input
    }
    var body: some View {
        return VStack(alignment: .leading) {
            Text(category)
            TextFieldView(tag: tag, text: input, onDismissKeyboard: nil)
                .padding(.trailing)
                .accentColor(.black)
            Divider()
        }.padding(.leading)
    }
}

struct InputFieldView_Previews: PreviewProvider {
    @State static private var input = ""
    static var previews: some View {
        InputFieldView(category: "Category", tag: 0, input: $input)
    }
}
