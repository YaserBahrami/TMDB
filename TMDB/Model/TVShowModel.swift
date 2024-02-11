//
//  TVShowModel.swift
//  TMDB
//
//  Created by Yaser on 10.02.2024.
//

import Foundation

struct MovieResponse: Codable {
    let results : [Movie]
}

struct Movie: Codable {
    
    var id: Int
    var title: String
    var overview: String
    var posterPath: String?
    var backdropPath: String?
    var releaseDate: String?
    var voteAverage: Double
    var popularity: Double
    var adult: Bool
    
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case title = "name"
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "first_air_date"
        case popularity
        case voteAverage = "vote_average"
        case adult
    }
    
//    init(json: JSON) {
//        id = json["id"].intValue
//        title = json["name"].stringValue
//        overView = json["overview"].stringValue
//        poster = json["poster_path"].stringValue
//        voteAverage = json["vote_average"].doubleValue
//        releaseDate = json["first_air_date"].stringValue
//        isAdult = json["adult"].boolValue
//    }
    
}

