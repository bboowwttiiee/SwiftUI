//
//  ContentView.swift
//  Dynamic Island
//
//  Created by bowtie on 16.09.2022.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        Text("In-app Push Notifications\nUsing Dynamic Island")
            .font(.title)
            .fontWeight(.semibold)
            .lineSpacing(12)
            .kerning(1.2)
            .multilineTextAlignment(.center)
            .onAppear(perform: authorizeNotifications)
    }
    
    // MARK: - Notification Request
    func authorizeNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
