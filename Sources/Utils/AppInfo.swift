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
            case .primaryColorHEX: return "Primary Color HEX"
            case .secondaryColorHEX: return "Secondary Color HEX"
            case .terciaryColorHEX: return "Terciary Color HEX"
            case .primaryTextColorHEX: return "Primary Text Color HEX"
            case .secondaryTextColorHEX: return "Secondary Text Color HEX"
            case .primaryFontName: return "Primary Font Name"
            case .secondaryFontName: return "Secondary Font Name"
            case .custom(let key): return key
            }
        }
    }
    
    
    public static func infoForKey(_ key: AppInfoKey) -> String {
        guard let info = Bundle.main.infoDictionary?[key.rawValue] as? String else {
            fatalError("Unable to get Info for key \(key.rawValue)")
        }
        return info
     }
}
