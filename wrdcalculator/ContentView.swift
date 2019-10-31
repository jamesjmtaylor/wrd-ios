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
    init(){
        UITabBar.appearance().backgroundColor = UIColor.red
        UITabBar.appearance().barTintColor = UIColor.red
        UITabBar.appearance().tintColor = UIColor.red
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
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
                .background(Color.red)
                .edgesIgnoringSafeArea(.top)

            TabView {
                KeView().environmentObject(KeViewModel()).tabItem {
                    Text("KE")
                    Image("first")
                }.tag(0)
                HeatView().environmentObject(HeatViewModel()).tabItem {
                    Text("HEAT")
                    Image("second")
                }.tag(1)
                EcmView().environmentObject(EcmViewModel()).tabItem {
                    Text("ECM")
                    Image("second")
                }.tag(2)
                ContactView().tabItem {
                    Text("Contact")
                    Image("second")
                }.tag(3)
            }//.accentColor(Color.red)//(Color.red)

            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
