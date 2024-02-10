//
//  TVShowModel.swift
//  TMDB
//
//  Created by Yaser on 10.02.2024.
//

import Foundation
import SwiftyJSON

struct TVShowModel {
    let id: Int
    let title: String
    let overView: String
    let poster: String?
    let voteAverage: Float
    let releaseDate: String?
    let isAdult: Bool?
    
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["name"].stringValue
        overView = json["overview"].stringValue
        poster = json["poster_path"].stringValue
        voteAverage = json["vote_average"].floatValue
        releaseDate = json["first_air_date"].stringValue
        isAdult = json["adult"].boolValue
    }
    
}
