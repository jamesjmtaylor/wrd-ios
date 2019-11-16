//
//  ContentView.swift
//  wrdcalculator
//
//  Created by James Taylor on 10/10/19.
//  Copyright © 2019 James Taylor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @State private var selection = 0
    init(){
        UITabBar.appearance().barTintColor = R.color.toolbarBackground() ?? .red
        UITabBar.appearance().unselectedItemTintColor = R.color.toolbarInactive() ??  UIColor.white
    }

    var body: some View {
        VStack {
            Text("Damage Calculator")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0.0)
                .padding()
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
                .background(Color(R.color.danger() ?? .red))
                .edgesIgnoringSafeArea(.top)

            TabView {
                KeView(vm: KeViewModel()).tabItem {
                    Text("KE")
                    Image(systemName: "bolt.fill")
                }.tag(0)
                HeatView(vm: HeatViewModel()).tabItem {
                    Text("HEAT")
                    Image(systemName: "flame.fill")
                }.tag(1)
                EcmView(vm: EcmViewModel()).tabItem {
                    Text("ECM")
                    Image(systemName: "airplane")
                }.tag(2)
                ContactView().tabItem {
                    Text("Contact")
                    Image(systemName: "person.crop.circle")
                }.tag(3)
            }.accentColor(Color(R.color.toolbarActive() ?? .yellow))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
