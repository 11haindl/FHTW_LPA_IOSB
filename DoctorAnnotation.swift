//
//  DoctorAnnotation.swift
//  Doctors
//
//  Created by Stefanie on 20.06.23.
//

import Foundation
import MapKit

class DoctorAnnotation: NSObject, MKAnnotation, Identifiable {
    let id: String
    let doctor: Doctor
    let coordinate: CLLocationCoordinate2D
    
    init(doctor: Doctor) {
        self.coordinate = CLLocationCoordinate2D(latitude: doctor.geometry.coordinates[1], longitude: doctor.geometry.coordinates[0])
        self.doctor = doctor
        self.id = doctor.id
    }
}
