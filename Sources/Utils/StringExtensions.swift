//
//  File.swift
//  
//
//  Created by Lucas Marques Bighi on 08/03/22.
//

import Foundation

public extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var isValidCPF: Bool {
        let cleanText = self.removingManyOcurrences(of: "-",".")
        return cleanText.count == 11
    }
    
    func removingManyOcurrences(of string: String...) -> String {
        var cleanString = self
        string.forEach { cleanString = cleanString.replacingOccurrences(of: $0, with: "") }
        return cleanString
    }
    
    func toDate(withFormat format: Format) -> Date? {
        let format = DateFormatter.dateFormat(fromTemplate: format.rawValue, options: 0, locale: .current)!
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
}
