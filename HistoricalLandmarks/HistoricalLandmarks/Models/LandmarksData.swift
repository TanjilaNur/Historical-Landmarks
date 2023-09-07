//
//  LandmarksData.swift
//  HistoricalLandmarks
//
//  Created by TanjilaNur-00115 on 23/6/23.
//

import Foundation
import MapKit

class LandmarksData {
    
    static let locations: [Landmarks] = [
        Landmarks(
            name: "The Great Wall of China",
            cityName: "Beijing,China",
            coordinates: CLLocationCoordinate2D(latitude: 40.3595, longitude: 116.0151),
            description: "The Great Wall of China is a series of fortifications that were built across the historical northern borders of ancient Chinese states and Imperial China as protection against various nomadic groups from the Eurasian Steppe.",
            imageNames: "The Great Wall of China"),
        
        Landmarks(
            name: "The Great Pyramid of Giza",
            cityName: "Cairo, Egypt",
            coordinates: CLLocationCoordinate2D(latitude: 29.9792, longitude: 31.1342),
            description: "The Great Wall of China is a series of fortifications that were built across the historical northern borders of ancient Chinese states and Imperial China as protection against various nomadic groups from the Eurasian Steppe.",
            imageNames: "The Great Pyramid of Giza"),
        
        Landmarks(
            name: "The Eiffel Tower",
            cityName: "Paris, France",
            coordinates: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
            description: "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. Constructed from 1887, it is named after the engineer Gustave Eiffel, whose company designed and built the tower.",
            imageNames: "The Eiffel Tower"),
        
        Landmarks(
            name: "Colosseum",
            cityName: "Rome, Italy",
            coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
            description: "Ancient amphitheater known for its gladiator contests and grand spectacles, a symbol of ancient Roman engineering and entertainment.",
            imageNames: "Colosseum"),
        
        Landmarks(
            name: "Taj Mahal",
            cityName: "Agra, India",
            coordinates: CLLocationCoordinate2D(latitude: 27.1751, longitude: 78.0421),
            description: " Iconic white marble mausoleum built by Mughal Emperor Shah Jahan in memory of his wife Mumtaz Mahal, known for its architectural beauty and symbolizing eternal love.",
            imageNames: "Taj Mahal"),
        
        Landmarks(
            name: "Acropolis of Athens",
            cityName: "Athens, Greece",
            coordinates: CLLocationCoordinate2D(latitude: 37.9715, longitude: 23.7261),
            description: "Ancient citadel featuring iconic structures such as the Parthenon, symbolizing the birthplace of Western civilization.",
            imageNames: "Acropolis of Athens")
        
    ]
    
}
