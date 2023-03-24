//
//  DarkMode.swift
//  My Day
//
//  Created by mac on 3/23/23.
//

import Foundation
import UIKit
class DarkMode {
    
    static let shared = DarkMode()
    
    private init() {}
    
    func handleDarkMode(darkMode: Bool) {
//        UIWindowScene.windows.first?.overrideUserInterfaceStyle = darkMode ? .dark : .light
//        Not sure how to use UIWindoScene just yet
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = darkMode ? .dark : .light
    }
    
}
