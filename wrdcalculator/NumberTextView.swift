//
//  NumberTextView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/20/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct NumberTextField: View {
    @State var numberValue: Double?
    var body: some View {
          let numberString = Binding<String>(
              get: { String(format: "%.02f", Double(self.numberValue)) },
              set: {
                  if let value = NumberFormatter().number(from: $0) {
                      self.numberValue = value.doubleValue
                  }
              }
          )
        return TextField("Number", text: numberString)
    }
}


struct NumberTextView_Previews: PreviewProvider {
    static var previews: some View {
        NumberTextField()
    }
}
