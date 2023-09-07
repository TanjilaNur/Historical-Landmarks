//
//  ContentView.swift
//  HistoricalLandmarks
//
//  Created by TanjilaNur-00115 on 23/6/23.
//

import SwiftUI
import MapKit

struct LandmarksView: View {

    @EnvironmentObject private var viewModel: LandmarksViewModel
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $viewModel.mapRegion,
                annotationItems: viewModel.locations,
                annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(viewModel.mapLocation == location ? 1.0 : 0.5)
                        .shadow(radius: 10)
                        .onTapGesture {
                            viewModel.showNextLocation(location: location)
                        }
                }
            })
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ForEach(viewModel.locations) { location in
                    if viewModel.mapLocation == location {
                        LocationPreviewView(location: location)
                            .shadow(color: Color.black.opacity(0.3), radius: 20)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .transition(
                                .asymmetric(
                                    insertion: viewModel.onRightButtonPressed ? .move(edge: .trailing) : .move(edge: .leading),
                                    removal: viewModel.onRightButtonPressed ? .move(edge: .leading) : .move(edge: .trailing)
                                )
                            )
                    }
                }
            }
            .frame(height: 350)
        }
    }
}

struct LocationMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .font(.headline)
                .foregroundColor(.red)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())
            }
    }
}

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LandmarksViewModel
    let location: Landmarks
    
    var body: some View {
            VStack {
                VStack(alignment: .center){
                    Image(location.imageNames)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 120)
                        .cornerRadius(10)
                        .padding(.bottom, 2)
                    
                    HStack{
                        Button {
                            vm.previousButtonPressed()
                        } label: {
                            Image(systemName: "arrow.left.circle")
                                .font(.headline)
                                .frame(width: 40, height: 40)
                                .cornerRadius(20)
                                .clipShape(Circle())
                        }
                        Spacer()
                        Text(location.name)
                                .font(.title3)
                                .multilineTextAlignment(.center)

                        Spacer()
                        Button {
                            vm.nextButtonPressed()
                        } label: {
                            Image(systemName: "arrow.right.circle")
                                .font(.headline)
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .cornerRadius(20)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    ScrollView(showsIndicators: false){
                        Text(location.cityName)
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                        Text(location.description)
                            .font(.body)
                            .padding(.top, 1)
                            .multilineTextAlignment(.center)
                    }
                    
                }
                .padding()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
