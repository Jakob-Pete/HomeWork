//
//  MainView.swift
//  My Day
//
//  Created by mac on 3/13/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Tracking", systemImage: "checkerboard.shield")
                }
            Dayscheduled()
                .tabItem{
                    Label("My Day", systemImage: "calendar")
                }
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.2.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
