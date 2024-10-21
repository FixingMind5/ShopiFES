//
//  HeaderView.swift
//  ShopiFES
//
//  Created by Teresa Tellez Giron Mejia on 20/10/24.
//

import SwiftUI

struct HeaderView: View {
    
    var body: some View {
        ZStack {
            Color("Color-Orange")
                .shadow(radius: 10)
                .ignoresSafeArea()
            
            Text("SHOPIFES")
                .foregroundStyle(.white)
                .fontWeight(.bold)
                //.padding(.bottom, 35)
                .font(.system(size: 23))
                .kerning(15)
        }
        .frame(height: 50, alignment: .top)
    }
}

#Preview {
    HeaderView()
}
