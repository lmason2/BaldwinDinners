//
//  CuisineDetailView.swift
//  BaldwinDinners
//
//  Created by Luke Mason on 1/16/22.
//

import SwiftUI

struct CuisineDetailView: View {
    let cuisine: Cuisine
    let recipes: [Dish]
    var body: some View {
        VStack {
            Group {
                Text(cuisine.name)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipped()
            .cornerRadius(10)
            .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
            
            Image(cuisine.image)
                .resizable()
                .scaledToFit()
                
                
            List {
                ForEach(recipes.filter {$0.cuisine == cuisine.name}) { recipe in
                    NavigationLink(destination: DishDetailView(dish: recipe)) {
                        DishRowListView(dish: recipe)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CuisineDetailView_Previews: PreviewProvider {
    static let cuisines: [Cuisine] = Bundle.main.decode("cuisine.json")
    static let recipes: [Dish] = Bundle.main.decode("recipes.json")
    static var previews: some View {
        CuisineDetailView(cuisine: cuisines[0], recipes: recipes)
    }
}
