//
//  PreviewApp.swift
//  Doctors
//
//  Created by Stefanie on 14.06.23.
//

import Foundation
import SwiftUI

struct PreviewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Model()) // Use a dummy data model for preview
        }
    }
}
