//
//  MovieDetailsViewModel.swift
//  TMDB
//
//  Created by Yaser on 12.02.2024.
//

import Foundation
import RxSwift
import Moya
import RxCocoa

class MovieDetailsViewModel {
    
    private let movieDetailsSubject = BehaviorSubject<Movie?>(value: nil)
    var movieDetails: Observable<Movie?> {
        return movieDetailsSubject.asObservable()
    }
    
    init(movie: Movie) {
        self.movieDetailsSubject.onNext(movie)
    }
    
}
