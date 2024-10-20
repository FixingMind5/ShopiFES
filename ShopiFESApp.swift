//
//  ShopiFESApp.swift
//  ShopiFES
//
//  Created by Manuel Alejandro Aguilar Tellez Giron on 01/09/24.
//

import SwiftUI

@main
struct ShopiFESApp: App {
    @State private var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            MapView()
        }
        .environment(locationManager)
        .modelContainer(Destination.preview)
    }
}
