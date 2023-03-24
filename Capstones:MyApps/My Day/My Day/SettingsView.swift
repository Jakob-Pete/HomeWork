//
//  Settings.swift
//  My Day
//
//  Created by mac on 3/10/23.
//

import SwiftUI

struct Settings: View {
    @Binding var darkModeEnabled: Bool
    var body: some View {
        NavigationView {
            
            Form {
                
                Section(header: Text("Display"),
                        footer: Text("System settings")) {
                    Toggle(isOn: $darkModeEnabled) {
                        Text("Dark mode")
                    }
                    .onChange(of: darkModeEnabled) { _ in
                        DarkMode.shared.handleDarkMode(darkMode: darkModeEnabled)
                    }
                    }
                }
            }
        .navigationTitle("Settings")
        }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(darkModeEnabled: .constant(false))
    }
}
