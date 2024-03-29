//
//  MainView.swift
//  My Day
//
//  Created by mac on 3/13/23.
//

import SwiftUI

struct MainView: View {
    @AppStorage("DarkModeEnabled") private var darkModeEnabled = false
//    @State var reminder: Reminder
    var body: some View {
        TabView {
            TrackingAppointmentsView()
                .tabItem {
                    Label("Tracking", systemImage: "checkerboard.shield")
                }
            Dayscheduled()
                .tabItem{
                    Label("My Day", systemImage: "calendar")
                }
            Settings(darkModeEnabled: $darkModeEnabled)
                .tabItem {
                    Label("Settings", systemImage: "gearshape.2.fill")
                }
        }
        .onAppear { DarkMode.shared.handleDarkMode(darkMode: darkModeEnabled)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
