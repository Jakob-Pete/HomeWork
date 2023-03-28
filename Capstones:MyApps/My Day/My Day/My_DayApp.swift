//
//  My_DayApp.swift
//  My Day
//
//  Created by mac on 3/10/23.
//

import SwiftUI

@main
struct My_DayApp: App {
    @State private var dataController = DataController()
//    let persistenceController = PersistenceController.shared
//    @State var reminder: Reminder
    var body: some Scene {
        WindowGroup {
//            core data is needde, this can be hard coded down below. also itll probably be an array of reminders
            MainView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
