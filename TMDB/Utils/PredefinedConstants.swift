//
//  PredefinedConstants.swift
//  TMDB
//
//  Created by Yaser on 10.02.2024.
//

import Foundation

class PredefinedConstants {
    static let shared = PredefinedConstants()
    
    init() {}
    
    func getAPIKey() -> String {
        return Credentials.shared.getAPIKey() //"YOUR_API_KEY"
    }
}
