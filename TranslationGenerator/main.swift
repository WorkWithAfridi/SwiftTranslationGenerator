//
//  script.swift
//
//
//  Created by Khondakar Afridi on 12/3/24.
//

import Foundation

// MARK: - Utility Function to Convert JSON to Localizable.strings Format
func convertJSONToLocalizableStrings(jsonFilePath: String, outputFolderPath: String, languageCode: String) {
    let fileManager = FileManager.default
    
    // Read JSON File
    guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonFilePath)) else {
        print("Failed to read JSON file: \(jsonFilePath)")
        return
    }
    
    // Parse JSON Data
    guard let translations = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: String] else {
        print("Failed to parse JSON file: \(jsonFilePath)")
        return
    }
    
    // Create Localizable.strings Content
    var localizableContent = ""
    for (key, value) in translations {
        localizableContent += "\"\(key)\" = \"\(value)\";\n"
    }
    
    // Create Language-Specific Folder
    let languageFolderPath = "\(outputFolderPath)/\(languageCode).lproj"
    if !fileManager.fileExists(atPath: languageFolderPath) {
        do {
            try fileManager.createDirectory(atPath: languageFolderPath, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("Failed to create folder: \(languageFolderPath). Error: \(error)")
            return
        }
    }
    
    // Write to Localizable.strings File
    let localizableFilePath = "\(languageFolderPath)/Localizable.strings"
    do {
        try localizableContent.write(toFile: localizableFilePath, atomically: true, encoding: .utf8)
        print("Generated Localizable.strings for \(languageCode) at \(localizableFilePath)")
    } catch {
        print("Failed to write Localizable.strings file: \(localizableFilePath). Error: \(error)")
    }
}

// MARK: - Main Script Logic
func processTranslations(inputFolderPath: String, outputFolderPath: String, languages: [String]) {
    for language in languages {
        let jsonFilePath = "\(inputFolderPath)/\(language).json"
        convertJSONToLocalizableStrings(jsonFilePath: jsonFilePath, outputFolderPath: outputFolderPath, languageCode: language)
    }
}

// MARK: - Script Parameters
let inputFolderPath = "/Users/khondakarafridi/Developer/TranslationGenerator/TranslationGenerator/translations" // Path to folder containing JSON files
let outputFolderPath =  "/Users/khondakarafridi/Developer/TranslationGenerator/TranslationGenerator/localized"    // Path to folder where .lproj folders will be created
let languages = ["en", "es", "de", "fr"]  // List of language codes

// Ensure Paths Exist
let fileManager = FileManager.default
if !fileManager.fileExists(atPath: inputFolderPath) {
    print("Input folder does not exist: \(inputFolderPath)")
    exit(1)
}

if !fileManager.fileExists(atPath: outputFolderPath) {
    do {
        try fileManager.createDirectory(atPath: outputFolderPath, withIntermediateDirectories: true, attributes: nil)
    } catch {
        print("Failed to create output folder: \(outputFolderPath). Error: \(error)")
        exit(1)
    }
}

// Process Translations
processTranslations(inputFolderPath: inputFolderPath, outputFolderPath: outputFolderPath, languages: languages)

