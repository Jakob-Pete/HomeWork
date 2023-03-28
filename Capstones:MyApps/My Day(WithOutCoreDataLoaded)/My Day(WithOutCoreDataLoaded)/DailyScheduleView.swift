//
//  ScheduledOverall.swift
//  My Day(WithOutCoreDataLoaded)
//
//  Created by mac on 3/27/23.
//

import SwiftUI


struct DailySchedule: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.startTime)
    ]) var reminders: FetchedResults<Reminder>
    
    @State private var showingAddScreen = false
//    @State var reminder: Reminder
    var body: some View {
        NavigationView {
            List {
                ForEach(reminders) { reminder in
                    NavigationLink {
                        ReminderDetailView(reminder: reminder)
                    } label: {
                        HStack {
                            Rectangle()
                                .frame(width: 20, height: 40)
                                .foregroundColor(.purple)
                            
                            VStack(alignment: .leading) {
                                Text(reminder.reminderTitle ?? "Error")
                                    .font(.headline)
                                
                                Text(reminder.additionalText ?? "Error")
                                    .foregroundColor(.secondary)
                                
                            }
                            Spacer()
                            VStack {
                                Text(reminder.startTime ?? Date(), format: .dateTime.hour().minute())
                                Text(reminder.endTime ?? Date(), format: .dateTime.hour().minute())
                            }
                            
                        }
                    }
                }
                .onDelete(perform: deleteReminders)
            }
            
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Reminder", systemImage: "plus")
                        }
                    }
                    
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddReminder()
                }
        }
    }
    func deleteReminders(at offsets: IndexSet) {
        for offset in offsets {
//            This method loops through to delete the reminder you made before
            let reminder = reminders[offset]
            moc.delete(reminder)
        }
        try? moc.save()
    }
}

struct ScheduledOverall_Previews: PreviewProvider {
    static var previews: some View {
        DailySchedule()
    }
}
