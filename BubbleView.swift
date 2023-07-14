//
//  BubbleView.swift
//  Doctors
//
//  Created by Stefanie on 20.06.23.
//

import SwiftUI

struct BubbleView: View {
    var doctor: Doctor
    
    var body: some View {
        // handle content visible in bubble
        VStack {
            Text(doctor.properties.name)
                .font(.headline)
            Text(doctor.properties.areaOfExpertise)
                .font(.subheadline)
            Text(doctor.properties.address)
                .font(.subheadline)
            if(doctor.properties.phone != nil){
                Text(doctor.properties.phone!)
                    .font(.subheadline)
            }
            Text(doctor.properties.internet)
                .font(.subheadline)
        }
        .padding()
        .background(Utilities().selectColor(areaOfExpertise: doctor.properties.areaOfExpertise))
        .cornerRadius(10)
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView(doctor: Doctor(
            id: "ARZTOGD.0000000",
            geometry: Geometry(coordinates: [16.3, 48.2]),
            properties: Property(
                id: 0000000,
                name: "Dr. Hugo Test",
                address: "00., Testgasse 1",
                areaOfExpertise: "Allgemeinmedizin",
                phone: "+43 660 000 00 00",
                internet: "https://www.technikum-wien.at/"
            )
        ))
    }
}

