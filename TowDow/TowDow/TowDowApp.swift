//
//  TowDowApp.swift
//  TowDow
//
//  Created by bowtie on 20.11.22.
//

import SwiftUI

@main
struct TowDowApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
