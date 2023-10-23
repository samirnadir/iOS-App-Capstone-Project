//
//  FoodDetail.swift
//  Little Lemon
//
//  Created by Sameer Ghauri on 23/09/2023.
//

import SwiftUI

struct MenuItemDetail: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    let  foodList : Dish
    
    var body: some View {
        VStack(){
            
            Header_section(enableBackButton: true)
            AsyncImage(url: URL(string: foodList.image ?? "")){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 400, height: 200)
            
            Text (foodList.title ?? "")
                .font(.title)
                .frame(alignment: .leading)
            
            Text(foodList.descriptionText ?? "")
                .font(.body)
            
            Spacer()
            
            Button(action:
                    {},
                   label: {
                Text("Add for $\(foodList.price ?? "")")
                    .font(.custom("Karla-ExtraBold", size: 20))
            })
            .buttonStyle(YellowButton())
        }.toolbar(.hidden)
    }
}


