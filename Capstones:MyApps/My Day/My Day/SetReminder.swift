//
//  SetReminder.swift
//  My Day
//
//  Created by mac on 3/15/23.
//

import SwiftUI

struct SetReminder: View {
    @State private var textField = ""
    var body: some View {
        NavigationView {
            Form {
                Text("Type in the name of your reminder")
                
                TextField("Reminder", text: $textField)
//                Toggle
                }
                
            }
        }
    }


struct SetReminder_Previews: PreviewProvider {
    static var previews: some View {
        SetReminder()
    }
}
