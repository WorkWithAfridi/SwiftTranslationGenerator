#  TranslationGenerator
TranslationGenerator is a Swift-based utility for generating and converting localization files for iOS applications. It automates the process of converting language-specific JSON files into Localizable.strings format and vice versa, and organizes them into .lproj directories, making it easier to manage multilingual support in your app.

## Features
- Converts JSON translation files (e.g., en.json, es.json) into Localizable.strings.
- Converts Localizable.strings files back to JSON format for easier management and collaboration.
- Automatically creates language-specific .lproj folders (e.g., en.lproj, es.lproj).
- Simplifies localization workflow for iOS projects.
- Easy to use and configurable.

## How to Use
1. Clone the Repository
git clone https://github.com/your-username/TranslationGenerator.git
cd TranslationGenerator

3. Add Translation Files
Place your JSON_translation or Localizable.string files inside the json_to_localized/json_input or localized_to_json/localized_input folder. 

4. Run the Script
Using Terminal: Run the script directly:
swift main.swift

Using Xcode:
Open the project in Xcode.
Edit the scheme to set the correct working directory to the project root.
Run the project.

4. Check the Output
The script will generate language-specific .lproj folders (e.g., en.lproj, es.lproj)/ en.json in the designated output folders, ie: json_to_localized/localizable_output or localized_to_json/json_output. 

## Customizing the Script
Input Folder: Update the jsonInputPath / localizedInputPath variable in the script to point to a custom folder.
Output Folder: Update the localizedOutputPath / jsonOutputPath variable to specify where the .lproj folders should be created.

## Contributions
Contributions are welcome! Feel free to open an issue or submit a pull request to enhance the script.
