//
//  Chef.swift
//  BaldwinDinners
//
//  Created by Luke Mason on 1/16/22.
//

import SwiftUI

struct Chef: Codable, Identifiable {
    let id: String
    let name: String
    let city: String
    let state: String
//    let dishes: [Dish]
    let image: String
}
