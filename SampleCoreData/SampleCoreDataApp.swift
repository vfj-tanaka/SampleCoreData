//
//  SampleCoreDataApp.swift
//  SampleCoreData
//
//  Created by mtanaka on 2022/10/04.
//

import SwiftUI

@main
struct SampleCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
