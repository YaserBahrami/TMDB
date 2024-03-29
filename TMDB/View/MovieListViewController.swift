//
//  MovieListViewController.swift
//  TMDB
//
//  Created by Yaser on 11.02.2024.
//

import UIKit
import RxSwift
import Moya
import RxCocoa


class MovieListViewController: UIViewController {
    
    let viewModel = MovieListViewModel()
    let disposeBag = DisposeBag()
    
    private let tableView = UITableView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        bindViewModel()
        
        viewModel.fetchMovies()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.tableFooterView = UIView()
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        // Enable automatic row height
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200 // Adjust the estimated row height as needed
        tableView.delegate = self
    }
    
    private func bindViewModel() {
        viewModel.movies
            .bind(to: tableView.rx.items(cellIdentifier: "MovieCell", cellType: MovieTableViewCell.self)) { (row, movie, cell) in
                cell.configure(with: movie)
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Movie.self)
            .subscribe(onNext: { [weak self] selectedMovie in
                // Handle selection if needed
                print("Selected Movie: \(selectedMovie.title)")
                self?.viewModel.selectedMovie.onNext(selectedMovie)
                
            })
            .disposed(by: disposeBag)
        
        viewModel.selectedMovie
            .subscribe(onNext: { [weak self] movie in
                self?.navigateToMovieDetails(movie: movie)
            })
            .disposed(by: disposeBag)
    }
    
    func navigateToMovieDetails(movie: Movie) {
        guard let navigationController = navigationController else {
                print("Navigation controller is nil")
                return
            }
        let movieDetailsViewModel = MovieDetailsViewModel(movie: movie)
        let movieDetailsViewController = MovieDetailsViewController(viewModel: movieDetailsViewModel)
        navigationController.pushViewController(movieDetailsViewController, animated: false)
    }
    
    
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastRowIndex = tableView.numberOfRows(inSection: 0) - 1
        if indexPath.row == lastRowIndex {
            // Fetch next page when reaching the end of the table view
            viewModel.fetchMovies()
        }
    }
}
   
