//
//  Dish.swift
//  BaldwinDinners
//
//  Created by Luke Mason on 1/16/22.
//

import SwiftUI

struct Dish: Codable, Identifiable {
    let id: String
    let name: String
    let chef: String
    let cuisine: String
    let tt: String
    let at: String
    let instructions: [Instructions]
    let background: String
    let image: String
    let gallery: [String]
}
