//
//  DirectoryManager.swift
//  TranslationGenerator
//
//  Created by Khondakar Afridi on 12/3/24.
//

import Foundation

// MARK: - DirectoryManager

/// A helper class for handling file and folder operations, such as creating directories.
class DirectoryManager {
    
    /// Creates a directory at the specified path if it doesn't already exist.
    /// - Parameter path: The path to the directory.
    /// - Throws: An error if the directory creation fails.
    static func createDirectory(at path: String) throws {
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: path) {
            try fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
    }
}
