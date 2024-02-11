//
//  MovieListViewModel.swift
//  TMDB
//
//  Created by Yaser on 11.02.2024.
//

import Foundation
import RxSwift

class MovieListViewModel {
    private let disposeBag = DisposeBag()
    var movies: PublishSubject<[Movie]> = PublishSubject()
    
    func fetchMovies() {

        NetworkService.shared.fetchPopularShows().subscribe(onNext: { response in
            self.movies.onNext(response.results)
            
        }) { error in
            print(error.localizedDescription)
        }.disposed(by: disposeBag)
        
    }
    
}
