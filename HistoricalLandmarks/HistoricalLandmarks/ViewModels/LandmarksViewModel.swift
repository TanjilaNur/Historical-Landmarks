//
//  LandmarksViewModel.swift
//  HistoricalLandmarks
//
//  Created by TanjilaNur-00115 on 23/6/23.
//

import SwiftUI
import MapKit

class LandmarksViewModel: ObservableObject {
    
    var locations: [Landmarks]
    @Published var onRightButtonPressed: Bool = true
    @Published var mapLocation: Landmarks {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var showLocationsList: Bool = false
    @Published var sheetLocation: Landmarks? = nil
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LandmarksData.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Landmarks) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Landmarks) {
        withAnimation(.easeInOut) {
            self.mapLocation = location
            self.showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        onRightButtonPressed = true

        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("currentIndex is invalid")
            return
        }
        
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
    
    func previousButtonPressed() {
        onRightButtonPressed = false
        guard let currentIndex = locations.lastIndex(where: { $0 == mapLocation }) else {
            print("currentIndex is invalid")
            return
        }
        
        let nextIndex = currentIndex - 1
        guard locations.indices.contains(nextIndex) else {
            guard let lastLocation = locations.last else { return }
            showNextLocation(location: lastLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }

    
}
