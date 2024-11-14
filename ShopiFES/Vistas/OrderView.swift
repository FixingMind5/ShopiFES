//
//  OrderView.swift
//  ShopiFES
//
//  Created by Manuel Aguilar on 22/10/24.
//

import SwiftUI
import MapKit
import SwiftData

let SHOPPERS_COORDINATES = [
    // Vendedor de Posgrado
    CLLocationCoordinate2D(latitude: 19.484425, longitude: -99.248400),
    // Vendedor de idiomas
    CLLocationCoordinate2D(latitude: 19.486348, longitude: -99.247485),
    // Vendedor pastos diseño
    CLLocationCoordinate2D(latitude: 19.482966, longitude: -99.245773),
    // Vendedor talleres
    CLLocationCoordinate2D(latitude: 19.482017, longitude: -99.245202)
]

let TEMP_USER_LOCATION = CLLocationCoordinate2D(latitude: 19.483165, longitude: -99.247155)

struct OrderView: View {
    @Environment(LocationManager.self) var locationManager
    
    @Query private var destinations: [Destination]
    @State private var destination: Destination?
    @State private var route: MKRoute?
    @State private var routeDisplaying: Bool = false
    @State private var routeDestination: MKMapItem?
    @State private var travelInterval: TimeInterval?
    @State private var showRoute: Bool = false
    var totalCarrito: Double = 0.0
    
    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var selectedPlacemark: MTPlacemark?
    
    var travelTime: String? {
        guard let travelInterval else { return nil }
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        
        return formatter.string(for: travelInterval)
    }
    
    var body: some View {
        VStack {
            HeaderView()
            
            Map(position: $cameraPosition, selection: $selectedPlacemark)
            {
                if showRoute {
                    Marker(item: MKMapItem(placemark: MKPlacemark(coordinate: TEMP_USER_LOCATION)))
                } else {
                    UserAnnotation()
                }
                
                if let route, routeDisplaying {
                    MapPolyline(route.polyline)
                        .stroke(.blue, lineWidth: 4)
                }
            }
                .onAppear {
                    destination = destinations.first
                    
                    if let region = destination?.region {
                        cameraPosition = .region(region)
                    }
                    
                    Task {
                        await fetchRoute()
                        showRoute.toggle()
                    }
                    
                }
                .onChange(of: showRoute, {
                    selectedPlacemark = nil
                    if showRoute {
                        withAnimation {
                            routeDisplaying = true
                            if let rect = route?.polyline.boundingMapRect {
                                cameraPosition = .rect(rect)
                            }
                        }
                    }
                })
            
            VStack {
                Text("Tu pedido llegará en \(route?.expectedTravelTime ?? 0) segundos")
                Text("$\(totalCarrito, specifier: "%.2f")")
            }
        }
    }
    
    func fetchRoute() async {
        if let userLocation = locationManager.userLocation /*, let selectedPlacemark */ {
            //Iniciando la petición
            let request = MKDirections.Request()
            
            // Inicializando las ubicaciones
            let sourcePlacermark = MKPlacemark(coordinate: TEMP_USER_LOCATION)
            //let sourcePlacermark = MKPlacemark(coordinate: userLocation.coordinate)
            let destinationPlacemark = MKPlacemark(coordinate: SHOPPERS_COORDINATES[Int.random(in: 0..<4)])
            
            // Inicializando origen y destino
            let routeSource = MKMapItem(placemark: sourcePlacermark)
            routeDestination = MKMapItem(placemark: destinationPlacemark)
            
            // Haciendo la petición
            request.source = routeSource
            request.destination = routeDestination
            request.transportType = .walking
            
            // Obteniendo las direcciones de la petición
            let directions = MKDirections(request: request)
            // Obteniendo las direcciones
            let result = try? await directions.calculate()
            
            route = result?.routes.first
        
            travelInterval = route?.expectedTravelTime
            
            //return result?.routes.first ?? MKRoute()
        }
        
        func removeRoute() {
            routeDisplaying = false
            showRoute = false
            route = nil
            selectedPlacemark = nil
            /*
            if let userLocation = locationManager.userLocation {
                updateCameraPosition()
             }
             */
        }
    }
}

#Preview {
    OrderView()
        .environment(LocationManager())
        .modelContainer(Destination.preview)
}
