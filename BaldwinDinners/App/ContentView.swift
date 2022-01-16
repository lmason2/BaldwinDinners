//
//  ContentView.swift
//  BaldwinDinners
//
//  Created by Luke Mason on 1/16/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let chefs: [Chef] = Bundle.main.decode("chefs.json")
    let recipes: [Dish] = Bundle.main.decode("recipes.json")
    let cuisines: [Cuisine] = Bundle.main.decode("cuisine.json")
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    @State private var setting: HomeSetting = .chef
    @State private var scaleValue: Double = 0.80
    
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Group {
                List {
                    if setting == .chef {
                        ForEach(chefs.shuffled()) {chef in
                            NavigationLink(destination: ChefDetailView(chef: chef, recipes: recipes)) {
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
                .scaleEffect(scaleValue)
                .onAppear {
                    withAnimation(.easeIn(duration: 0.5)) {
                        scaleValue = 1
                    }
                }
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
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        isOnboarding = true
                    }, label: {
                        Image(systemName: "flame.fill")
                    })
                }
            } //: TOOLBAR
        } //: NAVIGATION VIEW
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
