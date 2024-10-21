//
//  HomeView.swift
//  ShopiFES
//
//  Created by Manuel Alejandro Aguilar Tellez Giron on 01/09/24.
//

import SwiftUI

struct HomeView: View {
    @State var tabSelected: Int = 0
    @State var shoppingCart: [Product] = []

    var body: some View {
        TabView {
            Home(shoppingCart: $shoppingCart)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            
            Text("Busqueda")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Buscar")
                }.tag(1)
            
            ShoppingCartView(shoppingCart: $shoppingCart)
                .tabItem {
                    Image(systemName: "cart")
                    Text("Carrito")
                }.tag(2)
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(3)
        }
    }
    
    /* init() {
        
    } */
}

struct Home: View {
    @State var textoBusqueda: String = ""
    @Binding var shoppingCart: [Product]
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .top) {
                Color("Color-Orange")
                    .shadow(radius: 10)
                    .ignoresSafeArea()
                
                
                VStack {
                    // Header
                    Text("SHOPIFES")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 23))
                        .kerning(15)
                    
                    // Buscador
                    ZStack {
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundStyle(.white.opacity(0.5))
                            .frame(height: 40)
                            .shadow(radius: 6)
                        HStack {
                            
                            if (textoBusqueda.isEmpty) {
                                Text("Busca algo")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20))
                            }
                            
                            TextField("", text: $textoBusqueda)
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
                            
                            Spacer()
                            
                            Button(action: {
                                print("Buscar")
                            }, label: {
                                Image(systemName: "magnifyingglass")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20))
                            })
                            
                        }.padding(.horizontal, 30)
                    }.padding([.horizontal, .bottom], 20)
                    
                    
                    // Menu
                    List {
                        Section {
                            ForEach(productos) { producto in
                                NavigationLink(destination: {
                                    ProductDetailView(
                                        productImage: producto.image,
                                        productName: producto.name,
                                        productDescription: producto.descripcion,
                                        productPrice: producto.precio, shoppingCart: $shoppingCart
                                    )
                                }) {
                                    HStack {
                                        Image(producto.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 75, height: 75)
                                            
                                        VStack(alignment: .leading) {
                                            Text(producto.name)
                                                .font(.system(size: 22, weight: .bold))
                                                .foregroundStyle(Color("Color-Orange"))
                                            Text("$\(producto.precio, specifier: "%.2f")")
                                        }
                                    }
                                    
                                }
                            }
                            .listRowSeparator(.hidden)
                        }
                        .listSectionSeparator(.hidden)
                    }
                    .listStyle(.inset)
                }
                
            }
        }
    }
}

#Preview {
    HomeView()
}
