//
//  ReminderView.swift
//  My Day(WithOutCoreDataLoaded)
//
//  Created by mac on 3/28/23.
//

import SwiftUI

struct ReminderDetailView: View {
    let reminder: Reminder
    var body: some View {
        ScrollView {
            ZStack {
                Text(reminder.typeOfReminder ?? "Error")
                
                VStack {
                    Text(reminder.reminderTitle ?? "Error")
                    Spacer()
                    Text(reminder.additionalText ?? "Error")
                }
                
            }
        }
    }
}


