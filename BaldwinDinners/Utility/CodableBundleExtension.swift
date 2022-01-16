//
//  CodableBundleExtension.swift
//  BaldwinDinners
//
//  Created by Luke Mason on 1/16/22.
//

import Foundation

extension Bundle {
    // T is used for generic type
    func decode<T: Codable>(_ file: String) -> T {
        // 1. Locate the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        } // Check if the file exists
        
        // 2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        } // Check if the loaded file has data we can read
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        // 5. Return the ready-to-use data
        return loaded
    }
}
