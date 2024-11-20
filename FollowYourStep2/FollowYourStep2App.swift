//
//  FollowYourStep2App.swift
//  FollowYourStep2
//
//  Created by 李明哲 on 2024/11/20.
//

import SwiftUI

@main
struct FollowYourStep2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
