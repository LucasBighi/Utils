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
    
    var hasNumber: Bool {
        return self.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
    }
    
    var hasSpecialChars: Bool {
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        return self.rangeOfCharacter(from: characterset.inverted) != nil
    }
    
    var hasCapitalChars: Bool {
        let characterset = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        return self.rangeOfCharacter(from: characterset) != nil
    }
    
    var isValidEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
    var isValidCPF: Bool {
        if self.count == 14 {
            let cpfDigits = self.removingManyOcurrences(of: "-", ".").compactMap { Int(String($0)) }
            
            let verificatorDigits = cpfDigits.dropFirst(9)
            
            let nineDigits = cpfDigits.dropLast(2)
            let toMultiplyArray = Array(stride(from: 10, through: 2, by: -1))
            
            let sumResult = zip(nineDigits, toMultiplyArray).map { $0 * $1 }.reduce(0, +)
            
            let rest = (sumResult * 10) % 11
            
            let restResult = rest == 10 || rest == 11 ? 0 : rest
            
            if restResult == verificatorDigits.first {
                let tenDigits = cpfDigits.dropLast(1)

                let toMultiplyArray2 = Array(stride(from: 11, through: 2, by: -1))

                let sumResult2 = zip(tenDigits, toMultiplyArray2).map { $0 * $1 }.reduce(0, +)

                let rest2 = (sumResult2 * 10) % 11

                let restResult2 = rest2 == 10 || rest2 == 11 ? 0 : rest2
                
                return restResult2 == verificatorDigits.last
            }
        }
        return false
    }

}
