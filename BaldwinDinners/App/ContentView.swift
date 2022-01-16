//
//  ContentView.swift
//  BaldwinDinners
//
//  Created by Luke Mason on 1/16/22.
//

import SwiftUI

struct ContentView: View {
    let chefs: [Chef] = Bundle.main.decode("chefs.json")
    let recipes: [Dish] = Bundle.main.decode("recipes.json")
    let cuisines: [Cuisine] = Bundle.main.decode("cuisine.json")
    @State private var setting: HomeSetting = .chef
    
    var body: some View {
        NavigationView {
            Group {
                List {
                    if setting == .chef {
                        ForEach(chefs.shuffled()) {chef in
                            NavigationLink(destination: ChefDetailView()) {
                                ChefRowListView(chef: chef)
                            }
                        } //: LOOP
                    }
                    else if setting == .recipes {
                        ForEach(recipes.shuffled()) {recipe in
                            NavigationLink(destination: DishDetailView()) {
                                DishRowListView(dish: recipe)
                            }
                        } //: LOOP
                    }
                    else {
                        ForEach(cuisines.shuffled()) {cuisine in
                            NavigationLink(destination: CuisineDetailView()) {
                                CuisineRowListView(cuisine: cuisine)
                            }
                        } //: LOOP
                    }
                } //: LIST
            } //: GROUP
            .navigationBarTitle(setting.rawValue, displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        Button(action: {
                            setting = .chef
                            feedback.notificationOccurred(.success)
                        }, label: {
                            Image(systemName: "person")
                        }) //: PERSON
                        
                        Button(action: {
                            setting = .recipes
                            feedback.notificationOccurred(.success)
                        }, label: {
                            Image(systemName: "leaf")
                        }) //: LEAF
                        
                        Button(action: {
                            setting = .cuisine
                            feedback.notificationOccurred(.success)
                        }, label: {
                            Image(systemName: "globe.americas")
                        }) //: GLOBE
                    }
                } //: TOOLBARITEM
            } //: TOOLBAR
        } //: NAVIGATION VIEW
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
