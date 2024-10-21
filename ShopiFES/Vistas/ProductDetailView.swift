//
//  ProductDetailView.swift
//  ShopiFES
//
//  Created by Teresa Tellez Giron Mejia on 20/10/24.
//

import SwiftUI

struct ProductDetailView: View {
    @State private var numberOfProducts = 1
    @State var productImage: String
    @State var productName: String
    @State var productDescription: String
    @State var productPrice: Double
    
    @Binding var shoppingCart: [Product]
    
    var body: some View {
        //Text("Product Detai View")
        VStack {
            Image(productImage)
                .resizable()
                .scaledToFit()
                .frame(width: 450, height: 300)
            VStack(alignment: .leading) {
                Text(productName)
                    .font(.title)
                Text("Comprar $\(productPrice, specifier: "%.2f")")
                    .font(.system(size: 15))
                    .bold()
                Spacer()
                    .frame(height: 20)
                Text(productDescription)
                    .font(.system(size: 18))
            }
            .padding()
        }
        Spacer()
        VStack {
            HStack {
                Button("-") {
                    if numberOfProducts <= 1 {
                        numberOfProducts = 1
                    } else {
                        numberOfProducts -= 1
                    }
                }
                .frame(width: 35, height: 35)
                .foregroundStyle(.white)
                .background(Color("Color-Orange"))
                .clipShape(Circle())
                // Spacer(minLength: 30)
                Text("\(numberOfProducts)")
                
                Button("+") {
                    numberOfProducts += 1
                }
                .frame(width: 35, height: 35)
                .foregroundStyle(.white)
                .background(Color("Color-Orange"))
                .clipShape(Circle())
                
                
            }
            .frame(width: 450)
            .font(.system(size: 30))
            
            Button("Agregar al carrito", systemImage: "cart.fill.badge.plus") {
                shoppingCart.append(
                    Product(
                        name: productName,
                        precio: productPrice,
                        descripcion: productDescription,
                        image: productImage,
                        number: numberOfProducts
                    )
                )
            }
            .frame(width: 300, height: 50)
            .foregroundStyle(.white)
            .background(Color("Color-Orange"))
            .clipShape(Capsule())
            .padding()
        }
    }
}

#Preview {
    @Previewable @State var shoppingCart: [Product] = []
    
    ProductDetailView(
        productImage: "caballo",
        productName: "caballo homosexual de las montañas",
        productDescription: "iamgen de un caballo bien chidota",
        productPrice: 100,
        shoppingCart: $shoppingCart
    )
}
