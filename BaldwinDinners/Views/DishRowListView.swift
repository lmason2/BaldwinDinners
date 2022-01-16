//
//  DishRowListView.swift
//  BaldwinDinners
//
//  Created by Luke Mason on 1/16/22.
//

import SwiftUI

struct DishRowListView: View {
    // MARK: - PROPERTIES
    let dish: Dish
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 20) {
            Image(dish.image)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color("Gonzaga-Blue"), lineWidth: 3))
                .frame(width: 80, height: 80, alignment: .center)
            
            VStack(alignment: .leading){
                Text(dish.name)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                
                Text(dish.cuisine)
                    .font(.subheadline)
            } //: VSTACK
        } //: HSTACK
    }
}

// MARK: - PREVIEW
struct DishRowListView_Previews: PreviewProvider {
    static let dishes: [Dish] = Bundle.main.decode("recipes.json")
    
    static var previews: some View {
        DishRowListView(dish: dishes[0])
    }
}
