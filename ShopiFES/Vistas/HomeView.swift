//
//  HomeView.swift
//  ShopiFES
//
//  Created by Manuel Alejandro Aguilar Tellez Giron on 01/09/24.
//

import SwiftUI

struct HomeView: View {
    @State var tabSelected: Int = 0
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            
            Text("Busqueda")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Buscar")
                }.tag(1)
            
            Text("Carrito")
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
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("Color-Orange")
                .shadow(radius: 10)
            
            // Header
            VStack {
                Text("SHOPIFES")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .padding(.bottom, 35)
                    .font(.system(size: 23))
                    .kerning(15)
                
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
                }.padding(.horizontal, 20)
            }
            
            // Menu
            VStack {
                
            }
            
        }
        .frame(height: 250)
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
