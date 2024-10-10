//
//  ContentView.swift
//  ShopiFES
//
//  Created by Manuel Alejandro Aguilar Tellez Giron on 01/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 237/255, green: 122/255, blue: 48/255).ignoresSafeArea()
                
                VStack {
                    Text("SHOPIFES")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .padding(.bottom, 35)
                        .font(.system(size: 23))
                        .kerning(15)
                    
                    LoginSignupView()
                }
            }
        }
    }
}

struct LoginSignupView: View {
    @State var isLoginView = true
    var body: some View {
        
        VStack {
            
            HStack {
                Button(action: {
                    isLoginView = true
                    
                    
                }, label: {
                    Text("INICIAR SESIÓN")
                        .foregroundStyle(isLoginView ? .white : .white.opacity(0.7))
                        .fontWeight(isLoginView ? .bold : .regular)
                })
                Spacer()
                
                Button(action: {
                    isLoginView = false
                }, label: {
                    Text("REGISTRARSE")
                        .foregroundStyle(isLoginView ? .white.opacity(0.7) : .white)
                        .fontWeight(isLoginView ? .regular : .bold)
                })
            }
            .padding([.horizontal, .bottom], 30)
            
            if (isLoginView) {
                LoginView()
            } else {
                SignupView()
            }
        }
    }
}

#Preview {
    ContentView()
}
