//
//  NumberTextField.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/20/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct NumberTextField: View {
    @State var numberValue: Binding<Int>?
    var placeholderText: String?

    var body: some View {
        let numberString = Binding<String>(
            get: {
                guard let value = self.numberValue else {return ""}
                return String(format: "%d", value.wrappedValue)
            },
            set: {
                if let value = NumberFormatter().number(from: $0) {
                    //TODO: Figure out how to programmatically create/set a bindable object
//                    self.numberValue = value
                }
            }
        )

        return TextField(placeholderText ?? "", text: numberString).keyboardType(.numberPad)

      }
}

struct NumberTextField_Previews: PreviewProvider {
    static var previews: some View {
        NumberTextField(placeholderText: "Placeholder text")
    }
}
