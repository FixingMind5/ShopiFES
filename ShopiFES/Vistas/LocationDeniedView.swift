//
//  LocationDeniedView.swift
//  ShopiFES
//
//  Created by Manuel Aguilar on 11/10/24.
//

import SwiftUI

struct LocationDeniedView: View {
    var body: some View {
        ContentUnavailableView(
            label: {
                Label("Servicios de Ubicación Desactivados", systemImage: "location.slash.circle.fill")
        }, description: {
            Text("""
                 1. Presione el botón de abajo y vaya a "Seguridad y Privacidad"
                 2. Vaya a "Localización"
                 3. Encuentre "ShopiFES" y púlselo
                 4. Cambie la configuración a "Mientras la App está en uso"
                 """)
            .multilineTextAlignment(.leading)
        },
            actions: {
                Button(
                    action: {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!,
                                              options: [:],
                                              completionHandler: nil
                    )
                    }) {
                        Text("Abrir configuración")
                    }
            })
    }
}

#Preview {
    LocationDeniedView()
}
