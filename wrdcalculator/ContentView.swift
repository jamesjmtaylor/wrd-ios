//
//  ContentView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/10/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0

    var body: some View {
        TabView(selection: $selection){
            Text("First View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("KE")
                    }
                }
                .tag(0)
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("HEAT")
                    }
                }
                .tag(1)
            Text("First View")
                    .font(.title)
                    .tabItem {
                        VStack {
                            Image("first")
                            Text("ECM")
                        }
                    }
                    .tag(0)
                Text("Second View")
                    .font(.title)
                    .tabItem {
                        VStack {
                            Image("second")
                            Text("Contact")
                        }
                    }
                    .tag(1)
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
