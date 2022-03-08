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
}
