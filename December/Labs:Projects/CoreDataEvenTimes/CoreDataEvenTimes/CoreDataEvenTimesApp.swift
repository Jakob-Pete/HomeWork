//
//  CoreDataEvenTimesApp.swift
//  CoreDataEvenTimes
//
//  Created by mac on 12/9/22.
//

import SwiftUI

@main
struct CoreDataEvenTimesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
