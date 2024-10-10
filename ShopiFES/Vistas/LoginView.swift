//
//  LoginView.swift
//  ShopiFES
//
//  Created by Manuel Alejandro Aguilar Tellez Giron on 01/09/24.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Correo Electrónico")
                    .frame(alignment: .leading)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text(verbatim: "ejemplo@email.com")
                            .font(.caption)
                            .foregroundStyle(.white)
                    }
                    
                    TextField("", text: $email)
                }
                
                Divider()
                    .frame(height: 2)
                    .background(Color(.white))
                    .padding(.bottom)
            
                Text("Contraseña")
                    .frame(alignment: .leading)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text(verbatim: "**********")
                            .font(.caption)
                            .foregroundStyle(.white)
                    }
                    
                    SecureField("", text: $password)
                }
                    
                Divider()
                    .frame(height: 2)
                    .background(Color(.white))
                    .padding(.bottom)
                
                Button(action: {
                    print("Botón, ¿olvidaste tu contraseña?")
                }, label: {
                    Text("¿Olvidaste tu contraseña?")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.footnote)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                })
                .padding(.bottom, 20)
                
                Button(action: {
                    print("Registrarse ")
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .shadow(color: .white, radius: 6)
                            .foregroundStyle(.white)
                            .frame(height: 50)
                        
                        Text("Iniciar Sesión")
                            .foregroundStyle(Color("Color-Orange"))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .font(.system(size: 20))
                    }
                    
                })
                .padding(.bottom, 30)
                
                Text("Inicia sesión con alguna red social")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .padding(.bottom, 15)
                    .font(.system(size: 18))
                
                HStack {
                    Button(action: {
                        print("Login Facebook")
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(.white.opacity(0.3))
                                .frame(height: 30)
                            
                            Text("Facebook")
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.white)
                        }
                    })
                    
                    Spacer()
                    Button(action: {
                        print("Login Twitter")
                    }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(.white.opacity(0.3))
                                .frame(height: 30)
                            
                            Text("Twitter")
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.white)
                        }
                    })
                }.padding(.horizontal, 10)
                
                
            }.padding(.horizontal, 30)
        }
    }
}

#Preview {
    LoginView()
}
