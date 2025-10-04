//
// Created by luowei on 2019/12/11.
//

import Foundation

public extension Array {
    /// Parse Emoji emoticon ini file string
    /// - Parameter iniString: The ini file content as string
    /// - Returns: Array of dictionaries containing parsed emoticon data
    static func dictFromEmoticonIni(_ iniString: String) -> [[String: Any]] {
        var iniArr: [[String: Any]] = []

        var section: String?
        var itemDict: [String: Any]?

        let lines = iniString.components(separatedBy: .newlines)

        for line in lines {
            let trimmedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)

            // Skip empty lines
            if trimmedLine.isEmpty {
                continue
            }

            // Check for section headers [section]
            if let startRange = line.range(of: "["),
               let endRange = line.range(of: "]"),
               endRange.lowerBound > startRange.lowerBound {

                // Save previous itemDict if exists
                if let dict = itemDict {
                    iniArr.append(dict)
                }

                // Initialize new itemDict
                itemDict = [:]

                // Extract section name
                let startIndex = line.index(after: startRange.lowerBound)
                let endIndex = endRange.lowerBound
                section = String(line[startIndex..<endIndex])

            } else {
                // Parse key-value pairs
                let split = line.components(separatedBy: "  ")
                if let currentSection = section {
                    itemDict?[currentSection] = split.isEmpty ? NSNull() : split
                }
            }
        }

        // Add the last itemDict
        if let dict = itemDict {
            iniArr.append(dict)
        }

        return iniArr
    }
}
