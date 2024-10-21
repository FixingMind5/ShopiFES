//
//  ShoppingCartView.swift
//  ShopiFES
//
//  Created by Manuel Alejandro Aguilar Tellez Giron on 01/09/24.
//

import SwiftUI

struct ShoppingCartView: View {
    @Binding var shoppingCart: [Product]
    
    // Get route
    @State private var locationManager = LocationManager()
    @State var carritoTEMP: [Product] = [
        Product(
            name: "Playera Veguetta",
            precio: 200.0,
            descripcion: "Playera negra talla mediana con un diseño chidote de Veguetta",
            image: "Playera",
            number: 2
        ),
        Product(
            name: "Tote Bag Reputation",
            precio: 110.0,
            descripcion: "#EnVenta 🐍 \n Tenemos esta bonita Tote Bag de Reputation impresa por ambos lados (34x39cm) para entregar mañana y la siguiente semana. 🖤",
            image: "Tote_bag"
        ),
        Product(
            name: "Girasoles",
            precio: 10.0,
            descripcion: "Venta de girasoles y rosas amarillas! \n Girasol pequeño en $48 el pequeño, grande en $80 y rosas en $45 💛💫 \n Por ramo el precio cambia.🫶",
            image: "Girasol",
            number: 1
        )
    ]
    
    var totalCarrito: Double {
        var total = 0.0
        for producto in shoppingCart {
            total += producto.precio * Double(producto.number)
        }
        
        return total
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView()
                
                HStack {
                    Image(systemName: "cart")
                    Text("Tu carrito de compras")
                }
                .font(.title)
                .foregroundStyle(.colorOrange)
                .padding(.top, 30)
                
                List {
                    Section {
                        ForEach(shoppingCart) { product in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("\(product.name)")
                                        .font(.title)
                                    Text("\(product.number) unidades de $\(product.precio, specifier: "%.2f") cada una")
                                        .font(.system(size: 15, weight: .light))
                                        .foregroundStyle(Color(.lightGray))
                                }
                                Spacer()
                                Text("Total: $\(Double(product.number) * product.precio, specifier: "%.2f")")
                            }
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listSectionSeparator(.hidden)
                }
                .listStyle(.inset)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Total del carrito")
                        Text("$\(totalCarrito, specifier: "%.2f")")
                            .bold()
                            .font(.system(size: 32, weight: .black))
                    }
                    .foregroundStyle(.colorOrange)
                    Spacer()
                    
                    NavigationLink {
                        MapView()
                            .environment(locationManager)
                            .modelContainer(Destination.preview)
                    } label: {
                        Text("Ir a pagar")
                            .frame(width: 170, height: 50)
                            .background(.colorOrange)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    .clipShape(Capsule())
                    
                    
                }.padding([.trailing, .leading], 35)
                
            }
        }
        
        /*
            func calcularTotalCarrito() -> Double {
                var total = 0.0
                for producto in shoppingCart {
                    total += producto.precio * Double(producto.number)
                }
                
                return total
            }
         */
    }
}

#Preview {
    @Previewable @State var shoppingCart: [Product] = []
    ShoppingCartView(shoppingCart: $shoppingCart)
}
