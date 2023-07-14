//
//  Utilities.swift
//  Doctors
//
//  Created by Stefanie on 20.06.23.
//

import Foundation
import SwiftUI

struct Utilities{
    
    // select a specific color for the annotation based on
    // the doctors area of expertise
    func selectColor(areaOfExpertise: String) -> Color{
        var color: Color = .red
        switch areaOfExpertise {
        case "Allgemeinmedizin":
            color = .green
        case "Orthopädie u. Orthopädische Chirurgie":
            color = .gray
        case "Hals-, Nasen- u. Ohrenheilkunde":
            color = .blue
        case "Psychiatrie":
            color = .yellow
        case "Innere Medizin":
            color = .purple
        case "Haut- u. Geschlechtskrankheiten":
            color = .brown
        default:
            color = .red
        }
        return color;
    }
}

