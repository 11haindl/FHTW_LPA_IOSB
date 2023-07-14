//
//  ContentView.swift
//  Doctors
//
//  Created by Stefanie on 10.06.23.
//

import SwiftUI

struct ContentView: View {
    // environmentObject model needed for reload
    @EnvironmentObject private var model: Model
    
    // create a MapView to display the map
    // below dispaly a button which performs a reload to fetch data again
    var body: some View {
        VStack {
            MapView()
            Spacer().frame(height: 20.0)
             Button(action: {
                 model.load()
             }) {
                 Text("Refresh")
                     .padding()
                     .background(Color.green)
                     .foregroundColor(.white)
                     .cornerRadius(10)
             }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Model())
    }
}
