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
    
//    func fetchMovies(page: Int) -> Observable<MovieResponse> {
//        provider.rx.request(.popularMovies(page: page))
//            .asObservable()
//            .filterSuccessfulStatusAndRedirectCodes()
//            .map { result in
//                return try result.map ( MovieResponse.self )
//            }.catch { error in
//                return Observable.error(error)
//            }
//    }
    
    func fetchMovies(page: Int) -> Observable<MovieResponse> {
        return request(target: .popularMovies(page: page))
    }
    
    //Use generics to make the code reusable.
    func request<T: Codable>(target: NetworkProvider) -> Observable<T> {
        provider.rx.request(target)
            .asObservable()
            .filterSuccessfulStatusAndRedirectCodes()
            .map { result in
                return try result.map ( T.self )
            }.catch { error in
                return Observable.error(error)
            }
    }
}
