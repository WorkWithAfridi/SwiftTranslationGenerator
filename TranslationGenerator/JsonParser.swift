//
//  JsonParser.swift
//  TranslationGenerator
//
//  Created by Khondakar Afridi on 12/3/24.
//

import Foundation

// MARK: - JSONParser

/// A helper class for parsing JSON files containing translations.
class JSONParser {
    
    /// Reads the JSON file from the specified path and parses it into a dictionary of translations.
    /// - Parameter filePath: The path to the JSON file to be parsed.
    /// - Returns: A dictionary where keys are translation keys and values are their corresponding translations.
    static func parse(jsonFilePath: String) -> [String: String]? {
        guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonFilePath)) else {
            print("Failed to read JSON file: \(jsonFilePath)")
            return nil
        }
        
        guard let translations = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: String] else {
            print("Failed to parse JSON file: \(jsonFilePath)")
            return nil
        }
        
        return translations
    }
}
