//
//  TranslationProcessor.swift
//  TranslationGenerator
//
//  Created by Khondakar Afridi on 12/3/24.
//

import Foundation

// MARK: - TranslationProcessor

/// A class responsible for processing translations, including reading, converting, and writing the Localizable.strings files.
class TranslationProcessor {
    
    private let inputFolderPath: String
    private let outputFolderPath: String
    private let languages: [String]
    
    /// Initializes the translation processor with the given parameters.
    /// - Parameters:
    ///   - inputFolderPath: The folder path containing the input JSON files.
    ///   - outputFolderPath: The folder path where the .lproj directories will be created.
    ///   - languages: The list of language codes to process.
    init(inputFolderPath: String, outputFolderPath: String, languages: [String]) {
        self.inputFolderPath = inputFolderPath
        self.outputFolderPath = outputFolderPath
        self.languages = languages
    }
    
    /// Processes the translations by reading the JSON files, converting them to Localizable.strings format, and writing them to the output folder.
    func processTranslations() {
        let fileManager = FileManager.default
        
        // Ensure input folder exists
        guard fileManager.fileExists(atPath: inputFolderPath) else {
            print("Input folder does not exist: \(inputFolderPath)")
            return
        }
        
        // Ensure output folder exists or create it
        do {
            try DirectoryManager.createDirectory(at: outputFolderPath)
        } catch {
            print("Failed to create output folder: \(outputFolderPath). Error: \(error)")
            return
        }
        
        // Process each language's translation file
        for language in languages {
            let jsonFilePath = "\(inputFolderPath)/\(language).json"
            guard let translations = JSONParser.parse(jsonFilePath: jsonFilePath) else {
                continue
            }
            
            // Generate Localizable.strings content
            let localizableContent = LocalizableStringsGenerator.generate(from: translations)
            
            // Create the language-specific folder
            let languageFolderPath = "\(outputFolderPath)/\(language).lproj"
            do {
                try DirectoryManager.createDirectory(at: languageFolderPath)
                
                // Write to Localizable.strings file
                let localizableFilePath = "\(languageFolderPath)/Localizable.strings"
                try localizableContent.write(toFile: localizableFilePath, atomically: true, encoding: .utf8)
                print("Generated Localizable.strings for \(language) at \(localizableFilePath)")
            } catch {
                print("Failed to write Localizable.strings file for \(language). Error: \(error)")
            }
        }
    }
    
    
    /// Processes the translations by reading the Localizable.strings files, converting them to JSON, and writing them to the output folder.
    func processLocalizable() {
        let fileManager = FileManager.default
        
        // Ensure input folder exists
        guard fileManager.fileExists(atPath: inputFolderPath) else {
            print("Input folder does not exist: \(inputFolderPath)")
            return
        }
        
        // Ensure output folder exists or create it
        do {
            try DirectoryManager.createDirectory(at: outputFolderPath)
        } catch {
            print("Failed to create output folder: \(outputFolderPath). Error: \(error)")
            return
        }
        
        // Process each language's Localizable.strings file
        for language in languages {
            let languageFolderPath = "\(inputFolderPath)/\(language).lproj"
            let localizableFilePath = "\(languageFolderPath)/Localizable.strings"
            
            guard let translations = LocalizableParser.parse(localizableFilePath: localizableFilePath) else {
                continue
            }
            
            // Generate JSON data
            guard let jsonData = JSONGenerator.generateJSON(from: translations) else {
                continue
            }
            
            // Write to JSON file
            let jsonFilePath = "\(outputFolderPath)/\(language).json"
            do {
                try jsonData.write(to: URL(fileURLWithPath: jsonFilePath))
                print("Generated JSON for \(language) at \(jsonFilePath)")
            } catch {
                print("Failed to write JSON file for \(language). Error: \(error)")
            }
        }
    }
}
