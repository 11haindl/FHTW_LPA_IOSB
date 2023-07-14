//
//  DoctorsApp.swift
//  Doctors
//
//  Created by Stefanie on 10.06.23.
//

import SwiftUI

@main
struct DoctorsApp: App {
    //@StateObject private var dataModel = DataModel()
    @StateObject private var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
    
}
