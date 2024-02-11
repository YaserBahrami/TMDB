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
    case popularMovies(page: Int)
}

extension NetworkProvider: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/")!
    }
    
    var path: String {
        switch self {
        case .popularTVShows:
            return "tv/popular"
        case .popularMovies:
            return "tv/popular"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .popularTVShows:
            return .get
        case .popularMovies:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .popularTVShows:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
            
        case .popularMovies(let page):
            return .requestParameters(parameters: ["api_key": "\(Credentials.shared.getAPIKey)", "page": page], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json", "Authorization" : "Bearer \(Credentials.shared.getAPIReadAccessToken())"]
    }
    
    
}
