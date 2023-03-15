//
//  SetReminder.swift
//  My Day
//
//  Created by mac on 3/15/23.
//

import SwiftUI

struct SetReminder: View {
    @State private var textField = ""
    @State private var textField3 = ""
    @State private var reminderTime = defaultReminderTime
    
    static var defaultReminderTime: Date {
    var components = DateComponents()
    components.hour = 7
    components.minute = 0
    return Calendar.current.date(from: components) ?? Date.now
}
    
    var body: some View {
        NavigationView {
            Form {
                Text("Type in the name of your reminder")
                
                TextField("Reminder", text: $textField)
                
                //                Toggle
                
                
                DatePicker("Please enter a time", selection: $reminderTime, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                

                    TextField("Describe yourself", text: $textField3, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(5, reservesSpace: true)
                    
                    
                
            }.lineSpacing(100)
            
        }
    }
}


struct SetReminder_Previews: PreviewProvider {
    static var previews: some View {
        SetReminder()
    }
}
