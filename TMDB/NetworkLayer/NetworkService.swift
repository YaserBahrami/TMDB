//
//  NetworkService.swift
//  TMDB
//
//  Created by Yaser on 10.02.2024.
//

import Foundation
import Moya
import RxSwift

class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    private let provider = MoyaProvider<NetworkProvider>()
    
    func fetchPopularShows() -> Observable<MovieResponse> {
     
        provider.rx.request(.popularTVShows)
            .asObservable()
            .filterSuccessfulStatusAndRedirectCodes()
            .map { result in
                return try result.map ( MovieResponse.self )
            }.catch { error in
                return Observable.error(error)
            }
    }
}
