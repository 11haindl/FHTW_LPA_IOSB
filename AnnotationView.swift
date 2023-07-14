//
//  AnnotationView.swift
//  Doctors
//
//  Created by Stefanie on 20.06.23.
//

import SwiftUI

struct AnnotationView: View {
    var doctor: Doctor
    
    var body: some View {
        // design of the annotation
        ZStack{
            Circle()
                .fill(Utilities().selectColor(areaOfExpertise: doctor.properties.areaOfExpertise))
            Circle()
                .stroke(.black, lineWidth: 1)
        }
        .frame(width: 20, height: 20)
    }
}

struct AnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        AnnotationView(doctor: Doctor(
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
