//
//  MapView.swift
//  ShopiFES
//
//  Created by Manuel Aguilar on 10/10/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    // let manager = CLLocationManager()
    @Environment(LocationManager.self) var locationManager
    // @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var cameraPosition: MapCameraPosition = .automatic
    
    var body: some View {
        
        if locationManager.isAuthorized
        {
            Text("Hello Map View")
            Map(position: $cameraPosition)
            {
                UserAnnotation()
            }
            .onAppear {
                //updateCameraPosition()
                // 19.484270570957435, -99.24605098624986
                let acatlan_center = CLLocationCoordinate2D( latitude: 19.484270570957435, longitude: -99.24605098624986)
                let acatlan_span = MKCoordinateSpan(latitudeDelta: 0.0075, longitudeDelta: 0.0075)
                let acatlan_region = MKCoordinateRegion(center: acatlan_center, span: acatlan_span)
                cameraPosition = .region(acatlan_region)
            }
            .mapControls {
                MapUserLocationButton()
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
}

#Preview {
    MapView()
        .environment(LocationManager())
}
