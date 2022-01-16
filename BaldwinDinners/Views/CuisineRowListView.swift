//
//  CuisineRowListView.swift
//  BaldwinDinners
//
//  Created by Luke Mason on 1/16/22.
//

import SwiftUI

struct CuisineRowListView: View {
    // MARK: - PROPERTIES
    let cuisine: Cuisine
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 20) {
            Image(cuisine.image)
                .resizable()
                .scaledToFit()
                .overlay(Rectangle().stroke(Color("Gonzaga-Blue"), lineWidth: 1))
                .frame(width: 100, height: 80, alignment: .center)
    
            Text(cuisine.name)
                .font(.system(size: 20, weight: .bold, design: .rounded))
        } //: HSTACK
    }
}

// MARK: - PREVIEW
struct CuisineRowListView_Previews: PreviewProvider {
    static let cuisines: [Cuisine] = Bundle.main.decode("cuisine.json")
    static var previews: some View {
        CuisineRowListView(cuisine: cuisines[0])
    }
}
