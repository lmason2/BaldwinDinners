//
//  ChefRowListView.swift
//  BaldwinDinners
//
//  Created by Luke Mason on 1/16/22.
//

import SwiftUI

struct ChefRowListView: View {
    // MARK: - PROPERTIES
    let chef: Chef
    
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 20) {
            Image(chef.image)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color("Gonzaga-Blue"), lineWidth: 3))
                .frame(width: 80, height: 80, alignment: .center)
            
            VStack(alignment: .leading){
                Text(chef.name)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                
                Text(chef.city)
                    .font(.subheadline)
            } //: VSTACK
        } //: HSTACK
    }
}

// MARK: - PREVIEW
struct ChefRowListView_Previews: PreviewProvider {
    static let chefs: [Chef] = Bundle.main.decode("chefs.json")
    
    static var previews: some View {
        ChefRowListView(chef: chefs[0])
            .previewLayout(.sizeThatFits)
    }
}
