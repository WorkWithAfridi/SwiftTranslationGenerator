//
//  LocalizableParser.swift
//  TranslationGenerator
//
//  Created by Khondakar Afridi on 12/3/24.
//

import Foundation

// MARK: - LocalizableParser

/// A helper class for parsing Localizable.strings files.
class LocalizableParser {
    
    /// Parses a Localizable.strings file and converts its content into a dictionary of translations.
    /// - Parameter filePath: The path to the Localizable.strings file to be parsed.
    /// - Returns: A dictionary where keys are translation keys and values are their corresponding translations.
    static func parse(localizableFilePath: String) -> [String: String]? {
        guard let content = try? String(contentsOfFile: localizableFilePath, encoding: .utf8) else {
            print("Failed to read Localizable.strings file: \(localizableFilePath)")
            return nil
        }
        
        var translations = [String: String]()
        
        // Split the content into lines and process each line
        let lines = content.split(separator: "\n")
        for line in lines {
            let trimmedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Skip empty lines and comments
            if trimmedLine.isEmpty || trimmedLine.hasPrefix("//") {
                continue
            }
            
            // Match key-value pairs using regular expression
            let regex = try? NSRegularExpression(pattern: "\"([^\"]+)\" = \"([^\"]+)\";", options: [])
            let matches = regex?.matches(in: String(trimmedLine), options: [], range: NSRange(location: 0, length: trimmedLine.count))
            
            if let match = matches?.first {
                let keyRange = match.range(at: 1)
                let valueRange = match.range(at: 2)
                
                if let key = Range(keyRange, in: trimmedLine), let value = Range(valueRange, in: trimmedLine) {
                    translations[String(trimmedLine[key])] = String(trimmedLine[value])
                }
            }
        }
        
        return translations
    }
}

