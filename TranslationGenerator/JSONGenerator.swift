//
//  JSONGenerator.swift
//  TranslationGenerator
//
//  Created by Khondakar Afridi on 12/3/24.
//

import Foundation

// MARK: - JSONGenerator

/// A helper class for converting translations into JSON format.
class JSONGenerator {
    
    /// Converts a dictionary of translations into JSON data.
    /// - Parameter translations: A dictionary of translations.
    /// - Returns: The JSON data representing the translations dictionary.
    static func generateJSON(from translations: [String: String]) -> Data? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let jsonData = try encoder.encode(translations)
            return jsonData
        } catch {
            print("Failed to encode translations to JSON. Error: \(error)")
            return nil
        }
    }
}
