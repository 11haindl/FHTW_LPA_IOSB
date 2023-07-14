//
//  Doctor.swift
//  Doctors
//
//  Created by Stefanie on 10.06.23.
//

import Foundation

// structs to decode data
// sample data on the end of file
struct DoctorModel: Codable {
    
    let total: Int
    let doctors: [Doctor]?
    
    private enum CodingKeys: String, CodingKey{
        case total = "totalFeatures"
        case doctors = "features"
    }
}

struct Doctor: Codable, Identifiable {
    let id: String
    let geometry: Geometry
    let properties: Property
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case geometry = "geometry"
       case properties = "properties"
    }
}

struct Geometry: Codable {
    let coordinates: [Double]
    
    private enum CodingKeys: String, CodingKey{
        case coordinates = "coordinates"
    }
}

struct Property: Codable {
    let id: Int
    let name: String
    let address: String
    let areaOfExpertise: String
    // Sometimes "TELEFON" is null, that causes problems with decoding
    // so the datatype needs to be String? -> nil-handling when phone number is used
    let phone: String?
    let internet: String

    private enum CodingKeys: String, CodingKey {
        case id = "OBJECTID"
        case name = "NAME"
        case address = "ADRESSE"
        case areaOfExpertise = "FACH"
        case phone = "TELEFON"
        case internet = "INTERNET"
    }
}

/*
 Sample Data:
 {
     "type": "FeatureCollection",
     "totalFeatures": 7138,
     "features": [
         {
             "type": "Feature",
             "id": "ARZTOGD.9128072",
             "geometry": {
                 "type": "Point",
                 "coordinates": [
                     16.34238311965417,
                     48.20012893127945
                 ]
             },
             "geometry_name": "SHAPE",
             "properties": {
                 "OBJECTID": 9128072,
                 "NAME": "Dr. Simon Delacher",
                 "ADRESSE": "07., Seidengasse 27/5",
                 "FACH": "Psychiatrie u. Psychotherapeutische Medizin",
                 "TELEFON": "+43 699 108 49 577",
                 "INTERNET": "https://praxisplan.at/6660/simon-delacher/ordination/2",
                 "SE_ANNO_CAD_DATA": null
             }
         },
         {
             "type": "Feature",
             "id": "ARZTOGD.9128073",
             "geometry": {
                 "type": "Point",
                 "coordinates": [
                     16.32149472624508,
                     48.208594881723755
                 ]
             },
             "geometry_name": "SHAPE",
             "properties": {
                 "OBJECTID": 9128073,
                 "NAME": "Dr. Fatemeh Salmanian Hadji Agha",
                 "ADRESSE": "16., Koppstraße 84/16",
                 "FACH": "Allgemeinmedizin",
                 "TELEFON": "+43 1 492 09 05",
                 "INTERNET": "https://praxisplan.at/6663/fatemeh-salmanian-hadji-agha/ordination/1",
                 "SE_ANNO_CAD_DATA": null
             }
         },
         {
             "type": "Feature",
             "id": "ARZTOGD.9128074",
             "geometry": {
                 "type": "Point",
                 "coordinates": [
                     16.374288826294798,
                     48.2131668816634
                 ]
             },
             "geometry_name": "SHAPE",
             "properties": {
                 "OBJECTID": 9128074,
                 "NAME": "Dr. Mitra Seiser",
                 "ADRESSE": "01., Morzinplatz 4",
                 "FACH": "Allgemeinmedizin",
                 "TELEFON": "+43 1 532 03 34",
                 "INTERNET": "https://praxisplan.at/6664/mitra-seiser/ordination/1",
                 "SE_ANNO_CAD_DATA": null
             }
         },
         {
             //...
         }
     ],
     "crs": {
         "type": "name",
         "properties": {
             "name": "urn:ogc:def:crs:EPSG::4326"
         }
     }
 }
 */
