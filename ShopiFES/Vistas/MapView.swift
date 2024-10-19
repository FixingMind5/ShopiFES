//
//  MapView.swift
//  ShopiFES
//
//  Created by Manuel Aguilar on 10/10/24.
//

import SwiftUI
import MapKit
import SwiftData

struct MapView: View {
    @Environment(LocationManager.self) var locationManager
    // @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @Query private var listPlacemarks: [MTPlacemark]
    @State private var cameraPosition: MapCameraPosition = .automatic
    
    @State private var selectedPlacemark: MTPlacemark?
    
    // Route
    @State private var showRoute = false
    @State private var routeDisplaying = false
    @State private var route: MKRoute?
    @State private var routeError: Error?
    @State private var routeDestination: MKMapItem?
    @State private var travelInterval: TimeInterval?
    @State private var transportType = MKDirectionsTransportType.automobile
    
    var body: some View {
        
        if locationManager.isAuthorized
        {
            Map(position: $cameraPosition)
            {
                UserAnnotation()
                ForEach(listPlacemarks) { placemark in
                    if !showRoute {
                        Group {
                            if placemark.destination != nil {
                                Marker(coordinate: placemark.coordinate) {
                                    Label(placemark.name, systemImage: "star")
                                }
                                .tint(.yellow)
                            } else {
                                Marker(placemark.name, coordinate: placemark.coordinate)
                            }
                        }.tag(placemark)
                    } else {
                        if let routeDestination {
                            Marker(item: routeDestination)
                                .tint(.green)
                        }
                    }
                }
                
                if let route, routeDisplaying {
                    MapPolyline(route.polyline)
                        .stroke(.blue, lineWidth: 6)
                }
            }
            .onAppear {
                let acatlan_center = CLLocationCoordinate2D( latitude: 19.484270570957435, longitude: -99.24605098624986)
                let acatlan_span = MKCoordinateSpan(latitudeDelta: 0.0075, longitudeDelta: 0.0075)
                let acatlan_region = MKCoordinateRegion(center: acatlan_center, span: acatlan_span)
                cameraPosition = .region(acatlan_region)
            }
            .mapControls {
                MapUserLocationButton()
            }
            .task(id: selectedPlacemark) {
                if selectedPlacemark != nil {
                    routeDisplaying = false
                    showRoute = false
                    route = nil
                    await fetchRoute()
                }
            }
            .onChange(of: showRoute){
                selectedPlacemark = nil
                if showRoute {
                    withAnimation {
                        routeDisplaying = true
                        if let rect = route?.polyline.boundingMapRect {
                            cameraPosition = .rect(rect)
                        }
                    }
                }
            }
            
            
        } else {
            LocationDeniedView()
        }
        
    }
    
    func updateCameraPosition() {
        if let userLocation = locationManager.userLocation {
            let userRegion = MKCoordinateRegion(
                center: userLocation.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
            )
            withAnimation
            {
                cameraPosition = .region(userRegion)
            }
            
        }
    }
    
    func fetchRoute() async {
        if let userLocation = locationManager.userLocation, let selectedPlacemark {
            let request = MKDirections.Request()
            let sourcePlacemark = MKPlacemark(coordinate: userLocation.coordinate)
            let routeSource = MKMapItem(placemark: sourcePlacemark)
            let destinationPlacemark = MKPlacemark(coordinate: selectedPlacemark.coordinate)
            routeDestination = MKMapItem(placemark: destinationPlacemark)
            routeDestination?.name = selectedPlacemark.name
            request.source = routeSource
            request.destination = routeDestination
            request.transportType = transportType
            
            let directions = MKDirections(request: request)
            let result = try? await directions.calculate()
            route = result?.routes.first
            travelInterval = route?.expectedTravelTime
        }
    }
}

#Preview {
    MapView()
        .environment(LocationManager())
}
