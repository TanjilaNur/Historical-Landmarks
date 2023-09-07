//
//  HistoricalLandmarksApp.swift
//  HistoricalLandmarks
//
//  Created by TanjilaNur-00115 on 23/6/23.
//

import SwiftUI

@main
struct HistoricalLandmarksApp: App {
    
    @StateObject private var landmarksViewModel = LandmarksViewModel()
    
    var body: some Scene {
        WindowGroup {
            LandmarksView()
                .environmentObject(landmarksViewModel)
        }
    }
}
