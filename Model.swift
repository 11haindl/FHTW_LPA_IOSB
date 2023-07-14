//
//  Model.swift
//  Doctors
//
//  Created by Stefanie on 10.06.23.
//

import Foundation

class Model: ObservableObject {
    // create a List of Doctor Objects
    // publish it to have access from observe data changes
    @Published var doctorList = [Doctor]()
    
    // on initialization call load function
    init() {
        DispatchQueue.global(qos: .background).async {
            self.load()
        }
    }
    
    // get data from open government data in JSON format and decode it using the DoctorModel struct
    // set the published doctorList to an array of the first 500 entries of the decoded data
    // Note: limited entries to 500 due to a massive delay when using the application when all data gets fetched
    func load() {
        print("refersh");
        guard let url = URL(string: "https://data.wien.gv.at/daten/geo?service=WFS&request=GetFeature&version=1.1.0&typeName=ogdwien:ARZTOGD&srsName=EPSG:4326&outputFormat=json") else {
            print("URL invalid")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            guard error == nil else {
                print("\(error!.localizedDescription)")
                return
            }
            
            guard let responseData = data else {
                print("Received data was nil")
                return
            }
            
            guard let responseString = String(data: responseData, encoding: .utf8) else {
                print("Received data is not a valid UTF-8 string")
                return
            }
            
            //print(responseString)
            print("start decoding:")
            do {
                let doctorModel = try JSONDecoder().decode(DoctorModel.self, from: responseData)
                DispatchQueue.main.async {
                    self.doctorList = Array(doctorModel.doctors?.prefix(500) ?? [])
                    print("decoded!")
                }
            } catch {
                print("cannot decode responseData")
            }
        }
        task.resume()
    }
    
}
