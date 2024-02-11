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
    private let disposeBag = DisposeBag()
    private let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
}
