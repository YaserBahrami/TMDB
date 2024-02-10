//
//  NetworkProvider.swift
//  TMDB
//
//  Created by Yaser on 10.02.2024.
//

import Foundation
import Moya

enum NetworkProvider {
    case popularTVShows
}

extension NetworkProvider: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/")!
    }
    
    var path: String {
        switch self {
        case .popularTVShows:
            return "tv/popular"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .popularTVShows:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .popularTVShows:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json", "Authorization" : "Bearer \(Credentials.shared.getAPIKey())"]
    }
    
    
}
