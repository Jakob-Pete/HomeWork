//
//  SetReminder.swift
//  My Day
//
//  Created by mac on 3/15/23.
//

import SwiftUI

struct SetReminder: View {
    
    @State var reminder: Reminder
    @State private var textField = ""
    @State private var moreInfoTextField = ""
//    @State private var reminderTime = defaultReminderTime
    @State private var color = Color.red
    @State private var selectedReminder = "Event"
    @State private var selectedTime = Date()
    @State private var selectedEndTime = Calendar.current.date(byAdding: .hour, value: 1, to: Date())!
    
    var reminderType = ["Event", "Goal"]
    @Environment(\.dismiss) var dismiss
    
//    static var defaultReminderTime: Date {
//        var components = DateComponents()
//        components.hour = 5
//        components.minute = 0
//        return Calendar.current.date(from: components) ?? Date.now
//    }
    
    var body: some View {
        NavigationView {
            Form {
//                Text("Type in the name of your reminder")
                TextField("Reminder", text: $reminder.reminderTitle)
                
                HStack {
                    Text("Select a start time")
                    Spacer()
                    
                    DatePicker("Please enter a time", selection: $reminder.startTime,
                               displayedComponents: [.hourAndMinute])
                    .datePickerStyle(.compact)
                        .labelsHidden()
                        
                }
                
                DatePicker("End Time", selection: $reminder.endTime,
                           displayedComponents: [.hourAndMinute])
                .datePickerStyle(.compact)
                
                Picker("Event", selection: $reminder.typeOfReminder) {
                    ForEach(reminderType, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                
                ColorPicker("Choose a color for your reminder", selection: $reminder.colorReminder)
                
                TextField("Extras", text: $reminder.additionalText, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5, reservesSpace: true)
                
                
                Button("Save") {
                    scheduleNotification(at: selectedTime, title: textField, body: "Check out your next \(selectedReminder)!")
//                Code to save it to the my day view
                    dismiss()
                }
                .frame(width: 350.0, height: 40.0)
                
                .fixedSize()
                .foregroundColor(Color.white)
                .background(Color.blue)
                .clipShape(Capsule())// Set the button's background color
//                .cornerRadius(10) // Add corner radius to the button
//                .position(x: 100, y: 100) // Set the button's position
            }
            
        }
    }
    
    
    func scheduleNotification(at time: Date, title: String, body: String) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: time)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Notification scheduled!")
            }
        }
    }
//    func addReminder() {
//        let center = UNUserNotificationCenter.current()
//
//        let reminderRequest = {
//            let content = UNMutableNotificationContent()
//            content.title = textField
//            content.subtitle = moreInfoTextField
//            content.sound = UNNotificationSound.default
//
//            var dateComponents = DateComponents()
//            dateComponents.hour = 5
//            let trigger = UNCalendarNotificationTrigger(dateMatching: reminderTime, repeats: false)
////            let trigger = UNTimeIntervalNotificationTrigger(timeInterval:  , repeats: false)
//
//            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//            center.add(request)
//        }
//
//        center.getNotificationSettings { settings in
//            if settings.authorizationStatus == .authorized {
//                reminderRequest()
//            } else {
//                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//                    if success {
//                        reminderRequest()
//                    } else {
//                        print("Sorry there was an error")
//                    }
//                }
//            }
//        }
//
//    }
    
    
}


struct SetReminder_Previews: PreviewProvider {
    
    static var previews: some View {
        SetReminder(reminder: Reminder(reminderTitle: "", startTime: Date.now, endTime: Calendar.current.date(byAdding: .hour, value: 1, to: Date())!, typeOfReminder: "", colorReminder: Color.red, additionalText: ""))
    }
}
