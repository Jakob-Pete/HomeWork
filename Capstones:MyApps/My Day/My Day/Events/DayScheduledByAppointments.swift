//
//  DayScheduledByAppointments.swift
//  My Day
//
//  Created by mac on 3/21/23.
//

import SwiftUI

struct DayScheduledByAppointments: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var reminders: FetchedResults<Reminder>
    
    @State private var showingAddScreen = false
//    @State var reminder: Reminder
    var body: some View {
        NavigationView {
            Text("count: \(reminders.count)")
                .navigationTitle("My Day")
            
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Reminder", systemImage: "plus")
                        }
                    }
                    
                }
                .sheet(isPresented: $showingAddScreen) {
                    SetReminder()
                }
            //        HStack {
            //            ColorOfEvent(color: re)
            //            Spacer()
            //            TitleOfEvent(title: reminder)
            //            Spacer()
            //            TimeOfEvent()
            //        }
        }
    }
}

struct DayScheduledByAppointments_Previews: PreviewProvider {
    static var previews: some View {
        DayScheduledByAppointments()
    }
}
