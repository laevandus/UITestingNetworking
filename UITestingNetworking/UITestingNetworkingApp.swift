//
//  UITestingNetworkingApp.swift
//  UITestingNetworking
//
//  Created by Toomas Vahter on 14.05.2022.
//

import SwiftUI
import UITestingSupport

@main
struct UITestingNetworkingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            #if DEBUG
                .onAppear(perform: {
                    guard CommandLine.arguments.contains("--uitesting") else { return }
                    UITestingNetworkHandler.register()
                })
            #endif
        }
    }
}
