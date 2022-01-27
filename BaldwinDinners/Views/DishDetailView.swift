//
//  DishDetailView.swift
//  BaldwinDinners
//
//  Created by Luke Mason on 1/16/22.
//

import SwiftUI

struct DishDetailView: View {
    // MARK: - PROPERTIES
    let dish: Dish
    var body: some View {
        VStack {
            TabView {
                ForEach(dish.gallery, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(maxWidth: 300, minHeight: 148, idealHeight: 168, maxHeight: 180)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("Classic"), lineWidth: 3))
            .clipped()
            .shadow(color: Color.gray, radius: 5, x: 0, y: 0)
            
            
            Text(dish.name)
                .foregroundColor(.accentColor)
                .font(.system(size: 24, weight: .bold, design: .rounded))
            
            Text(dish.background)
                .foregroundColor(Color("Classic"))
                .font(.system(size: 18, weight: .light, design: .rounded))
            
            List(dish.instructions, children: \.substeps) { step in
                StepRowView(step: step, isOn: false)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
            }
            
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DishDetailView_Previews: PreviewProvider {
    static let dishes: [Dish] = Bundle.main.decode("recipes.json")
    static var previews: some View {
        DishDetailView(dish: dishes[0])
    }
}
