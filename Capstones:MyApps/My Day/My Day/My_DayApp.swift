//
//  My_DayApp.swift
//  My Day
//
//  Created by mac on 3/10/23.
//

import SwiftUI

@main
struct My_DayApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
