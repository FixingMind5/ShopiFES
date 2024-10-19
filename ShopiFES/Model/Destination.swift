//
//  Destination.swift
//  ShopiFES
//
//  Created by Manuel Aguilar on 18/10/24.
//

import SwiftData
import MapKit

@Model
class Destination {
    var name: String
    var latitude: Double?
    var longitude: Double?
    var latitudeDelta: Double?
    var longitudeDelta: Double?
    
    @Relationship(deleteRule: .cascade)
    var placemarks: [MTPlacemark] = []
    
    init(name: String, latitude: Double? = nil, longitude: Double? = nil, latitudeDelta: Double? = nil, longitudeDelta: Double? = nil) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.latitudeDelta = latitudeDelta
        self.longitudeDelta = longitudeDelta
    }
    
    var region: MKCoordinateRegion? {
        if let latitude, let longitude, let latitudeDelta, let longitudeDelta {
            return MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                span: MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
            )
        } else {
            return nil
        }
    }
}

extension Destination {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: Destination.self,
            configurations: ModelConfiguration(
                isStoredInMemoryOnly: true
                )
            )
        
        let acatlan = Destination(
            name: "UNAM - FES Acatlán",
            latitude: 19.484270570957435,
            longitude: -99.24605098624986,
            latitudeDelta: 0.0075,
            longitudeDelta: 0.0075
        )
        
        container.mainContext.insert(acatlan)
        
        var placemarks: [MTPlacemark] {
            [
                MTPlacemark(name: "entradaPrincipal", latitude: 19.482097, longitude: -99.244669),
                MTPlacemark(name: "cedetec", latitude: 19.482137, longitude: -99.246935),
                MTPlacemark(name: "talleresDiseño", latitude: 19.482020, longitude: -99.245311),
                MTPlacemark(name: "explanadaMAC", latitude: 19.482427, longitude: -99.246227),
                MTPlacemark(name: "cuaisMAC", latitude: 19.482494, longitude: -99.245698),
                MTPlacemark(name: "ventanillasEscolares", latitude: 19.482491, longitude: -99.246625),
                MTPlacemark(name: "edificioA15", latitude: 19.483257, longitude: -99.245478),
                MTPlacemark(name: "ventanillasSocioEconomicas", latitude: 19.482923, longitude: -99.247034),
                MTPlacemark(name: "moduloSindicato", latitude: 19.482506, longitude: -99.247423),
                MTPlacemark(name: "estatuaSorJuana", latitude: 19.483109, longitude: -99.246321),
                MTPlacemark(name: "canchaFutbol", latitude: 19.483708, longitude: -99.245201),
                MTPlacemark(name: "canchasBasquetbol", latitude: 19.483475, longitude: -99.244587),
                MTPlacemark(name: "explanadaPrincipal", latitude: 19.483464, longitude: -99.246841),
                MTPlacemark(name: "pastosCanchas", latitude: 19.483933, longitude: -99.245650),
                MTPlacemark(name: "cafe8", latitude: 19.483995, longitude: -99.246375),
                MTPlacemark(name: "piedra", latitude: 19.483193, longitude:  -99.247173),
                MTPlacemark(name: "explanadaDerecho", latitude: 19.484455, longitude:  -99.247292),
                MTPlacemark(name: "pastosEdificioGobierno", latitude: 19.483525, longitude: -99.247566),
                MTPlacemark(name: "enfermería", latitude: 19.483767, longitude: -99.247957),
                MTPlacemark(name: "pastosPosgrado", latitude: 19.484614, longitude: -99.247945),
                MTPlacemark(name: "posgrado", latitude: 19.484485, longitude: -99.248440),
                MTPlacemark(name: "monumentoAPicachú", latitude: 19.484980, longitude: -99.247456),
                MTPlacemark(name: "pastosCafeteríaLibrería", latitude: 19.484768, longitude: -99.246031),
                MTPlacemark(name: "jardónAcadémico", latitude: 19.485032, longitude: -99.247135),
                MTPlacemark(name: "placaFES", latitude: 19.485565, longitude: -99.246861),
                MTPlacemark(name: "estrellaIdiomas", latitude: 19.485732, longitude: -99.247748),
                MTPlacemark(name: "teatroJavierBarros", latitude: 19.485770, longitude: -99.248482),
                MTPlacemark(name: "maquinasEjercicio", latitude: 19.486001, longitude: -99.246972),
                MTPlacemark(name: "pastosTeatroBarros", latitude: 19.485709, longitude: -99.248939)
            ]
        }
        
        placemarks.forEach { placemark in
            acatlan.placemarks.append(placemark)
        }
        
        return container
    }
}
