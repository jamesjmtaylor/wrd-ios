//
//  InputButtonRow.swift
//  wrdcalculator
//
//  Created by James Taylor on 11/3/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct InputButtonRow: View {
    var leftTitle: String
    var rightTitle: String
    var leftColor: UIColor
    var rightColor: UIColor
    var leftTextColor: UIColor
    var rightTextColor: UIColor
    var leftFunction: ()->()
    var rightFunction: ()->()
    var body: some View {
                    HStack {
            Button(leftTitle,action: leftFunction)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
            .background(Color(leftColor))
            .foregroundColor(Color(leftTextColor))
            .cornerRadius(10)
            .shadow(radius: 3)
                .padding(.trailing, 4)
            Button(rightTitle,action: rightFunction)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
            .background(Color(rightColor))
            .foregroundColor(Color(rightTextColor))
            .cornerRadius(10)
            .shadow(radius: 3)
                .padding(.leading, 4)

                    }.padding(.bottom).padding([.leading,.trailing], 64)
    }
}

struct InputButtonRow_Previews: PreviewProvider {
    static var previews: some View {
        InputButtonRow(leftTitle: "Left",rightTitle: "Right",
                       leftColor: R.color.button() ?? .gray,
                       rightColor: R.color.button() ?? .gray,
                        leftTextColor: R.color.dark() ?? .black,
                        rightTextColor: R.color.dark() ?? .black,
                       leftFunction: {},rightFunction: {})
    }
}
