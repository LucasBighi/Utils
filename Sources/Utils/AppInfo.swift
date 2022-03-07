//
//  File.swift
//  
//
//  Created by Lucas Marques Bighi on 07/03/22.
//

import Foundation

public struct AppInfo {
    public enum AppInfoKey {
        case baseURL
        //UI
        //Colors
        case primaryColorHEX
        case secondaryColorHEX
        case terciaryColorHEX
        //Text Colors
        case primaryTextColorHEX
        case secondaryTextColorHEX
        //Fonts
        case primaryFontName
        case secondaryFontName
        //Custom
        case custom(key: String)
        
        public var rawValue: String {
            switch self {
            case .baseURL: return "BASE_URL"
            case .primaryColorHEX: return "PRIMARY_COLOR_HEX"
            case .secondaryColorHEX: return "SECONDARY_COLOR_HEX"
            case .terciaryColorHEX: return "TERCIARY_COLOR_HEX"
            case .primaryTextColorHEX: return "PRIMARY_TEXT_COLOR_HEX"
            case .secondaryTextColorHEX: return "SECONDARY_TEXT_COLOR_HEX"
            case .primaryFontName: return "PRIMARY_FONT_NAME"
            case .secondaryFontName: return "SECONDARY_FONT_NAME"
            case .custom(let key): return key
            }
        }
    }
    
    
    public func infoForKey(_ key: AppInfoKey) -> String {
        guard let info = Bundle.main.infoDictionary?[key.rawValue] as? String else {
            fatalError("Unable to get Info for key \(key.rawValue)")
        }
        return info
     }
}
