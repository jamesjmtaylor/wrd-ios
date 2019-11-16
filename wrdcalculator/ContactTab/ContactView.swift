//
//  ContactView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/28/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct ContactView: View {
    let homepage = URLRequest(url: URL(string: "https://www.jjmtaylor.com")!)
    var body: some View {
        return ZStack{
            Text("Loading")
            WebView(request: homepage).edgesIgnoringSafeArea(.top)
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
