//
//  AddReminder.swift
//  My Day(WithOutCoreDataLoaded)
//
//  Created by mac on 3/27/23.
//

import SwiftUI
struct AddReminder: View {
    @Environment(\.managedObjectContext) var moc
    //    @State var reminder: Reminder
    @State private var reminderTitle = ""
    @State private var additionalText = ""
    //    @State private var reminderTime = defaultReminderTime
    @State private var color = Color.red
    @State private var typeOfReminder = "Event"
    @State private var startTime = Date()
    @State private var endTime = Calendar.current.date(byAdding: .hour, value: 1, to: Date())!
    
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
                TextField("Reminder", text: $reminderTitle)
                
                HStack {
                    Text("Select a start time")
                    Spacer()
                    
                    DatePicker("Please enter a time", selection: $startTime,
                                 displayedComponents: [.hourAndMinute])
                    .datePickerStyle(.compact)
                    .labelsHidden()
//                    .minuteInterval(5)
                }
                
                DatePicker("End Time", selection: $endTime,
                           displayedComponents: [.hourAndMinute])
                .datePickerStyle(.compact)
//                .minuteInterval(5)
                
                Picker("Event", selection: $typeOfReminder) {
                    ForEach(reminderType, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                ColorPicker("Choose a color for your reminder", selection: $color)
                
                TextField("Extras", text: $additionalText, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5, reservesSpace: true)
                
                Button("Save") {
                    scheduleNotification(at: startTime, title: reminderTitle, body: "Check out your next \(typeOfReminder)!")
                    //                Code to save it to the my day view
                    let newReminder = Reminder(context: moc)
                    newReminder.reminderTitle = reminderTitle
                    newReminder.startTime = startTime
                    newReminder.endTime = endTime
                    newReminder.additionalText = additionalText
                    
                    try? moc.save()
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


struct AddReminder_Previews: PreviewProvider {
    
    static var previews: some View {
        AddReminder()
    }
}
