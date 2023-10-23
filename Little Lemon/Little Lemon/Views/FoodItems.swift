//
//  FoodItems.swift
//  Little Lemon
//
//  Created by Sameer Ghauri on 23/09/2023.
//

import SwiftUI

struct FoodItems: View {
    let foodList : Dish
    
    var body: some View {
        HStack(alignment: .top){
            VStack (alignment: .leading){
                
                Text (foodList.title ?? "")
                    .font(.CardTitle())
                    .foregroundColor(.black)
                
                Text (foodList.descriptionText ?? "")
                    .frame(maxWidth: 300)
                    .font(.ParagraphText())
                    .frame(alignment: .leading)
                    .lineLimit(2)
                    .foregroundColor(.PrimaryColor1)
                    .padding([.top,.bottom,.trailing],10)
                
                Text ("$ \(foodList.price ?? "")")
                    .font(.HighlightText())
                    .foregroundColor(.PrimaryColor1)
                    .bold()
            }
            Spacer()
            VStack(alignment: .trailing){
                Spacer()
                AsyncImage(url: URL(string: foodList.image ?? "")){ image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: 90, maxHeight: 90)
                .clipShape(Rectangle())
            }
        }.padding([.bottom,.top],10)
    }
}

