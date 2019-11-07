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
        UITabBar.appearance().backgroundColor = R.color.danger() ?? .red
        UITabBar.appearance().barTintColor = R.color.danger() ?? .red
        UITabBar.appearance().tintColor = R.color.danger() ?? .red
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
                KeView(vm: KeViewModel()).tabItem {
                    Text("KE")
                    Image("ke_tab")
                }.tag(0)
                HeatView(vm: HeatViewModel()).tabItem {
                    Text("HEAT")
                    Image("heat_tab")
                }.tag(1)
                EcmView(vm: EcmViewModel()).tabItem {
                    Text("ECM")
                    Image("ecm_tab")
                }.tag(2)
                ContactView().tabItem {
                    Text("Contact")
                    Image("contact_tab")
                }.tag(3)
            }.accentColor(R.color.)//(Color.red)

            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
