//
//  Dayscheduled.swift
//  My Day
//
//  Created by mac on 3/10/23.
//

import SwiftUI
import UserNotifications
struct Dayscheduled: View {
    @State private var dayTimes = ["5am", "6am", "7am", "8am", "9am", "10am", "11am", "12pm", "1pm", "2pm", "3pm",  "4pm", "5pm", "6pm", "7pm", "8pm", "9pm", "10pm", "11pm"]
    @State private var alertIsOn = false
    @State private var newReminderAlert = false
    @State private var reminderName = ""
    var body: some View {
        NavigationView {
            List {
                ForEach(dayTimes, id: \.self) {
                        Text("\($0)")
                    }
                
            }.listStyle(.grouped)
            

//            need to add a button to the bottom trailing side, neeed to set line inbetween the numbers from the day and those need to be leading from 5am to 11pm
            .navigationTitle("Your Day")
            .toolbar {
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
        }
    }
}

struct Dayscheduled_Previews: PreviewProvider {
    static var previews: some View {
        Dayscheduled()
    }
}
