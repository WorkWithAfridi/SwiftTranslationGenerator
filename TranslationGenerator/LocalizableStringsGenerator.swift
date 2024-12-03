//
//  LocalizableStringsGenerator.swift
//  TranslationGenerator
//
//  Created by Khondakar Afridi on 12/3/24.
//

// MARK: - LocalizableStringsGenerator

/// A helper class for converting a dictionary of translations into a Localizable.strings format.
class LocalizableStringsGenerator {
    
    /// Converts a dictionary of translations to Localizable.strings content.
    /// - Parameter translations: A dictionary of translations where the key is the translation key and the value is the translation.
    /// - Returns: A string formatted in the Localizable.strings format.
    static func generate(from translations: [String: String]) -> String {
        var localizableContent = ""
        for (key, value) in translations {
            localizableContent += "\"\(key)\" = \"\(value)\";\n"
        }
        return localizableContent
    }
}
