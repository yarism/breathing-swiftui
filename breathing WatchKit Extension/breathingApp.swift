//
//  breathingApp.swift
//  breathing WatchKit Extension
//
//  Created by Joakim Johansson on 2022-08-14.
//

import SwiftUI

@main
struct breathingApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
