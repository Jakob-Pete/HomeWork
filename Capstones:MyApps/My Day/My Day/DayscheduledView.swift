//
//  Dayscheduled.swift
//  My Day
//
//  Created by mac on 3/10/23.
//

import SwiftUI
import UserNotifications
struct Dayscheduled: View {
//    another options is only showing what events you have coming up and what time they are coming up, apple calender has a option for it that i can refrence, also uses multiple views to complete a day with appointments/events
    @State private var dayTimes = ["5am", "6am", "7am", "8am", "9am", "10am", "11am", "12pm", "1pm", "2pm", "3pm",  "4pm", "5pm", "6pm", "7pm", "8pm", "9pm", "10pm", "11pm"]
    @State private var alertIsOn = false
    @State private var newReminderAlert = false
    @State private var reminderName = ""
    @State private var differentView = false
//    @State var reminder: Reminder
    var body: some View {
//        make a view that scrolls for the whole view instead of the list so it goes over the entire view
        NavigationView {
            List {
                ForEach(dayTimes, id: \.self) {
                        Text("\($0)")
                    }
//             (vStack)   Have a veiw for the whole day and give it a height
            }.listStyle(.grouped)
//            make a v stack for blocking out appointments and make sure they have a height depending on the time youre using

//            need to add a button to the bottom trailing side, neeed to set line inbetween the numbers from the day and those need to be leading from 5am to 11pm
        
            .toolbar {
                Button {
                    differentView.toggle()
                } label: {
                    Label("Different day view", systemImage: "plus")
                } .sheet(isPresented: $differentView) {
                    
                } content: {
                    DayScheduledByAppointments()
                    
                }
                
                Button {
                    newReminderAlert.toggle()
                    print("Created New Goal/Event")
                } label: {
                     Label("New event", systemImage: "plus")
//                    Used a label for accessibility benefits for screen readers
                } .sheet(isPresented: $newReminderAlert) {
                    
                } content: {
                    SetReminder()
                }
            }
            .navigationTitle("Your Day")
        }
    }
}

struct Dayscheduled_Previews: PreviewProvider {
    static var previews: some View {
        Dayscheduled()
    }
}
