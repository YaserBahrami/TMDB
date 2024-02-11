//
//  MovieListViewController.swift
//  TMDB
//
//  Created by Yaser on 11.02.2024.
//

import UIKit
import RxSwift
import Moya


class MovieListViewController: UIViewController {

    
    let viewModel = MovieListViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchMovies()
    }
}
