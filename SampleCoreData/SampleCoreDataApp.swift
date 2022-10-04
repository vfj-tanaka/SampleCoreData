//
//  SampleCoreDataApp.swift
//  SampleCoreData
//
//  Created by mtanaka on 2022/10/04.
//

import SwiftUI

@main
struct SampleCoreDataApp: App {
    // NSPersistentContainerの初期化
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            // @Environment(\.managedObjectContext)にNSManagedObjectContextを登録する処理
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
