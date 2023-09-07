//
//  Landmarks.swift
//  HistoricalLandmarks
//
//  Created by TanjilaNur-00115 on 23/6/23.
//

import Foundation
import MapKit

struct Landmarks: Identifiable, Equatable {
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: String
    
    var id: String {
        name + cityName
    }
    
    static func == (lhs: Landmarks, rhs: Landmarks) -> Bool {
        lhs.id == rhs.id
    }

}
