//
//  ContentView.swift
//  Mati
//
//  Created by xinkev on 20/06/2023.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("launchAtLogin") var isLaunchAtLoginOn = true
    var body: some View {
        ZStack {
            TabView {
                Toggle("Launch at login", isOn: $isLaunchAtLoginOn)
                    .tabItem {
                        Label("General", systemImage: "gear")
                    }
            }.frame(width: 200, height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
