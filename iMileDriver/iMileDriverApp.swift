//
//  iMileDriverApp.swift
//  iMileDriver
//
//  Created by Takeshi on 2/14/22.
//

import SwiftUI

@main
struct iMileDriverApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
