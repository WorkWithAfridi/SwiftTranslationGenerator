## TranslationGenerator
TranslationGenerator is a Swift-based utility for generating Localizable.strings files for iOS applications from JSON translation files. It automates the process of converting language-specific JSON files into Localizable.strings format and organizes them into .lproj directories, making it easier to manage multilingual support in your app.

Features
Converts JSON translation files (e.g., en.json, es.json) into Localizable.strings.
Automatically creates language-specific .lproj folders (e.g., en.lproj, es.lproj).
Simplifies localization workflow for iOS projects.
Easy to use and configurable.
Folder Structure
The script expects a folder structure like this:

TranslationGenerator/
├── translations/
│   ├── en.json
│   ├── es.json
│   ├── fr.json
│   └── de.json
└── main.swift

Where:

translations/ contains your JSON files, named using the language code (e.g., en.json for English, es.json for Spanish).
main.swift is the script file.

How to Use
1. Clone the Repository
git clone https://github.com/your-username/TranslationGenerator.git
cd TranslationGenerator

3. Add Translation Files
Place your JSON translation files inside the translations folder. Example of an en.json file:

{
  "greeting": "Hello",
  "farewell": "Goodbye"
}

4. Run the Script
Using Terminal: Run the script directly:
swift main.swift

Using Xcode:
Open the project in Xcode.
Edit the scheme to set the correct working directory to the project root.
Run the project.

4. Check the Output
The script will generate language-specific .lproj folders (e.g., en.lproj, es.lproj) in the same directory as the script. Each folder will contain a Localizable.strings file with the translations.

Example Output
If you have an en.json file like this:
{
  "greeting": "Hello",
  "farewell": "Goodbye"
}

The script will generate an en.lproj/Localizable.strings file:
"greeting" = "Hello";
"farewell" = "Goodbye";

Customizing the Script
Input Folder: Update the inputFolderPath variable in the script to point to a custom folder.
Output Folder: Update the outputFolderPath variable to specify where the .lproj folders should be created.

Contributions
Contributions are welcome! Feel free to open an issue or submit a pull request to enhance the script.
