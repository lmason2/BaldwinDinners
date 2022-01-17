//
//  Instructions.swift
//  BaldwinDinners
//
//  Created by Luke Mason on 1/17/22.
//

import SwiftUI

struct Instructions: Codable, Identifiable {
    let id = UUID()
    let step: String
    var substeps: [Instructions]?
}
