//
//  NumberTextField.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/20/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct NumberTextField: View {
    @State var numberValue: Double?
    var placeholderText: String

    var body: some View {
        let numberString = Binding<String>(
            get: { String(format: "%.02f", Double(self.numberValue ?? 0.0)) },
            set: {
                if let value = NumberFormatter().number(from: $0) {
                    self.numberValue = value.doubleValue
                }
            }
        )

        return VStack {
            TextField(placeholderText, text: numberString)
                .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)

            Text("number: \(numberValue ?? 0.0)")
        }
      }
}

struct NumberTextField_Previews: PreviewProvider {
    static var previews: some View {
        NumberTextField(placeholderText: "Placeholder text")
    }
}
