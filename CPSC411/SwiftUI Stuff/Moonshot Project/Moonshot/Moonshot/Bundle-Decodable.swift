//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by csuftitan on 12/1/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T { // T is a placeholder representing an unknown type, Codable ensures that we are decoding a type that works
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd" // MM is case sensitive cause mm is for minutes, I think
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) in bundle.")
        }
        return loaded
    }
}
