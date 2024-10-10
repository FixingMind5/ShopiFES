//
//  SignupView.swift
//  ShopiFES
//
//  Created by Manuel Alejandro Aguilar Tellez Giron on 01/09/24.
//

import SwiftUI

struct SignupView: View {
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    var body: some View {
        ZStack {
            Color("Color-Orange")
            
            VStack(alignment: .leading) {
                
                // Imagen de perfil
                VStack(alignment: .center) {
                    Text("Elige una foto de perfil")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Text("Puedes cambiarla más adelante")
                        .foregroundStyle(.white)
                        .font(.system(size: 14))
                    
                    ZStack {
                        Circle()
                            .frame(width: 150)
                            .foregroundStyle(.gray)
                        Image(systemName: "camera")
                            .foregroundStyle(.white)
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 20)
                
                // ---------------
                // Formulario
                Text("Correo Electrónico*")
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
                        .foregroundStyle(.white)
                }
                
                Divider()
                    .frame(height: 2)
                    .background(Color(.white))
                    .padding(.bottom)
                
                Text("Contraseña*")
                    .frame(alignment: .leading)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text(verbatim: "*******")
                            .font(.caption)
                            .foregroundStyle(.white)
                    }
                    
                    SecureField("", text: $password)
                        .foregroundStyle(.white)
                }
                
                Divider()
                    .frame(height: 2)
                    .background(Color(.white))
                    .padding(.bottom)
                
                Text("Confirmar Contraseña*")
                    .frame(alignment: .leading)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                ZStack(alignment: .leading) {
                    if confirmPassword.isEmpty {
                        Text(verbatim: "*******")
                            .font(.caption)
                            .foregroundStyle(.white)
                    }
                    
                    SecureField("", text: $confirmPassword)
                        .foregroundStyle(.white)
                }
                
                Divider()
                    .frame(height: 2)
                    .background(Color(.white))
                    .padding(.bottom)
                
                Button(action: {
                    print("Registrarse ")
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .shadow(color: .white, radius: 6)
                            .foregroundStyle(.white)
                            .frame(height: 50)
                        
                        Text("Registrarse")
                            .foregroundStyle(Color("Color-Orange"))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .font(.system(size: 20))
                    }
                    
                })
                .padding(.bottom, 30)
                
                // -------------
                // Redes sociales
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
                
                
            }
            .padding(.horizontal, 32)
        }
    }
}

#Preview {
    SignupView()
}
