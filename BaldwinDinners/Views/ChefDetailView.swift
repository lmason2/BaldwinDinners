//
//  ChefDetailView.swift
//  BaldwinDinners
//
//  Created by Luke Mason on 1/16/22.
//

import SwiftUI

struct ChefDetailView: View {
    let chef: Chef
    let recipes: [Dish]
    var body: some View {
        VStack {
            Text(chef.name)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(Color("Gonzaga-Blue"))
                .background(
                    Color.accentColor
                        .frame(height: 6)
                        .offset(y: 24)
                )
            
            Image(chef.image)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color("Gonzaga-Blue"), lineWidth: 5))
                .frame(width: 150, height: 150)
            
            Text("\(chef.city), \(chef.state)")
                .font(.subheadline)
            
            List {
                ForEach(recipes.filter {$0.chef == chef.name}) { recipe in
                    NavigationLink(destination: DishDetailView()) {
                        DishRowListView(dish: recipe)
                    }
                }
            }//: LIST
        }//: VSTACK
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChefDetailView_Previews: PreviewProvider {
    static let chefs: [Chef] = Bundle.main.decode("chefs.json")
    static let recipes: [Dish] = Bundle.main.decode("recipes.json")
    
    static var previews: some View {
        ChefDetailView(chef: chefs[0], recipes: recipes)
    }
}
