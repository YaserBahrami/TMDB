//
//  MovieListViewModel.swift
//  TMDB
//
//  Created by Yaser on 11.02.2024.
//

import Foundation
import RxSwift
import Moya
import RxCocoa

class MovieListViewModel {
    private let disposeBag = DisposeBag()
//    var movies: PublishSubject<[Movie]> = PublishSubject()
    
    private let moviesSubject = BehaviorSubject<[Movie]>(value: [])
    var movies: Observable<[Movie]> {
        return moviesSubject.asObservable()
    }

    private var currentPage = 1
    
    
    func fetchMovies() {
        NetworkService.shared.fetchMovies(page: currentPage).subscribe(onNext: { response in
            
            var currentMovies = try? self.moviesSubject.value()
            currentMovies = currentMovies ?? []
            currentMovies?.append(contentsOf: response.results)
            if let updatedMovies = currentMovies {
                self.moviesSubject.onNext(updatedMovies)
            }
            self.currentPage += 1
            
        }) { error in
            print(error.localizedDescription)
        }.disposed(by: disposeBag)
    }
    
}
