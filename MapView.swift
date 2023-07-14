//
//  MapView.swift
//  Doctors
//
//  Created by Stefanie on 11.06.23.
//

import SwiftUI
import MapKit

struct MapView: View {
    // environment object model provides the fetched data from open government data
    @EnvironmentObject private var model: Model
    
    // mapRegion is the region displayed on the map
    // initialized with coordinates of FH Technikum Wien
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.2395854, longitude: 16.3743125), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    // save the coordinates of the last clicked Annotation in UserDefaults
    var latidude: Double = UserDefaults.standard.double(forKey: "latidude")
    var longitude: Double =  UserDefaults.standard.double(forKey: "longitude")
    
    // variable to dedect which Doctors Annotation is currently selected
    @State private var selectedAnnotation: Doctor?

    var body: some View {
        // create a new Map Object to be displayed using the set mapRegion and annotationItems from the models doctorList mapped to DoctorAnnotations
        Map(coordinateRegion: $mapRegion, annotationItems: model.doctorList.map{ DoctorAnnotation(doctor: $0)}) {
            // create a MapAnnotation for every doctor in the models doctorList
            annotation in
            MapAnnotation(coordinate: annotation.coordinate) {
                AnnotationView(doctor: annotation.doctor)
                .onTapGesture {
                    //get selected Annotation
                    updateSelectedAnnotation(annotation.doctor)
                    // set coordinates of current Annotation as defaults
                    let defaults = UserDefaults.standard
                    defaults.set(annotation.coordinate.latitude, forKey: "latidude")
                    defaults.set(annotation.coordinate.longitude, forKey: "longitude")
                }
            }
        }.onAppear{
            // when View appears set correct region
            updateMapRegion()
        }.overlay(
            // handle content visible in bubble
            selectedAnnotation.map {
                doctor in
                BubbleView(doctor: doctor)
            }
            // tab on bubble to close it
            .onTapGesture {
                updateSelectedAnnotation(nil)
            }
        )
    }
    
    // set the selectet annotation
    private func updateSelectedAnnotation(_ doctor: Doctor?) {
        selectedAnnotation = doctor
    }
    
    // set the region displayed:
    // If latidude and longitude stored in userDefaults are both  not 0.0, set the mapRegion to those coordinates. If not, use the mapRegion will not be changed (initialized on beginning of the view)
    private func updateMapRegion(){
        if (self.latidude != 0.0) && (self.longitude != 0.0){
            mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.latidude, longitude: self.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        }
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(Model())
    }
}
