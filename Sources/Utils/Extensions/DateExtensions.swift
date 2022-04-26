//
//  File.swift
//  
//
//  Created by Lucas Marques Bighi on 08/03/22.
//

import Foundation

public extension Date {
    func toString(withFormat format: DateFormat) -> String {
        let format = DateFormatter.dateFormat(fromTemplate: format.rawValue, options: 0, locale: .current)!
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
