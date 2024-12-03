//
//  Script.swift
//
//
//  Created by Khondakar Afridi on 12/3/24.
//

import Foundation

// MARK: - Script Execution to Generate Localizable from Json

/// Main execution of the script.

// Path to folder containing JSON files
let jsonInputPath = "/Users/khondakarafridi/Developer/TranslationGenerator/TranslationGenerator/json_to_localized/json_input"

// Path to folder where .lproj folders will be created
let localizedOutputPath = "/Users/khondakarafridi/Developer/TranslationGenerator/TranslationGenerator/json_to_localized/localized_output"

// List of language codes
let jsonToLocalizedLanguages = ["en", "es", "de", "fr"]

// Initialize and run the TranslationProcessor
let jsonToLocalizedProcessor = TranslationProcessor(inputFolderPath: jsonInputPath, outputFolderPath: localizedOutputPath, languages: jsonToLocalizedLanguages)
jsonToLocalizedProcessor.processTranslations()


// MARK: - Script Execution to Generate Json from Localizable

/// Main execution of the script.

// Path to folder containing .lproj files
let localizedInputPath = "/Users/khondakarafridi/Developer/TranslationGenerator/TranslationGenerator/localized_to_json/localized_input"

// Path to folder where JSON files will be created
let jsonOutputPath = "/Users/khondakarafridi/Developer/TranslationGenerator/TranslationGenerator/localized_to_json/json_output"

// List of language codes
let localizedToJsonLanguages = ["en",]

// Initialize and run the TranslationProcessor
let localizedToJsonProcessor = TranslationProcessor(inputFolderPath: localizedInputPath, outputFolderPath: jsonOutputPath, languages: localizedToJsonLanguages)
localizedToJsonProcessor.processLocalizable()
