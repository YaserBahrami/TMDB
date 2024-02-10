//
//  NetworkService.swift
//  TMDB
//
//  Created by Yaser on 10.02.2024.
//

import Foundation
import Moya
import SwiftyJSON

class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    private let provider = MoyaProvider<NetworkProvider>()
    
    func fetchPopularShows(callback: @escaping (Result<[TVShowModel]>) -> Void) {
        provider.request(.popularTVShows) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
                let jsonObj = JSON(data)
                
                if statusCode == 200 {
                    let list = JSON(jsonObj["results"].object)
//                    print(jsonObj["results"])
                    var tvShowList: [TVShowModel] = []
                    for item in list {
//                        print(item.1)
                        tvShowList.append(TVShowModel(json: item.1))
                    }
//                    print(jsonObj)
                    callback(.success(value: tvShowList))
                } else {
                    print(statusCode)
                    callback(.failure(error: "There is an issue"))
                }
            case .failure(_):
                callback(Result.failure(error: "Something went wrong, Try again."))
            }
        }
    }
}
