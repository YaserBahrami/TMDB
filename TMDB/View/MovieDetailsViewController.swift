//
//  MovieDetailsViewController.swift
//  TMDB
//
//  Created by Yaser on 12.02.2024.
//

import UIKit
import RxSwift
import AlamofireImage

class MovieDetailsViewController: UIViewController {

    private let viewModel: MovieDetailsViewModel
    private let disposeBag = DisposeBag()
    
    // UI Components
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    
    private let backgroundImageView = UIImageView()
    private let titleLabel = UILabel()
    private let overviewLabel = UILabel()
    private let voteAverageLabel = UILabel()
    private let releaseDate = UILabel()
    private let popularity = UILabel()
    private let isAdult = UILabel()
    private let originalLanguage = UILabel()
    
    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindViewModel()

    }
    
    private func setupUI() {
        // Add UI components and set up constraints using SnapKit
        
        titleLabel.numberOfLines = 0
        overviewLabel.numberOfLines = 0
        
        backgroundImageView.contentMode = .scaleAspectFit
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        // Content View Constraints
        

        // Background Image View
        contentView.addSubview(backgroundImageView)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view.bounds.width * 0.6) // Adjust the height as needed
        }
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(overviewLabel)
        contentView.addSubview(voteAverageLabel)
        contentView.addSubview(releaseDate)
        contentView.addSubview(popularity)
        contentView.addSubview(isAdult)
        contentView.addSubview(originalLanguage)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        voteAverageLabel.snp.makeConstraints { make in
            make.top.equalTo(overviewLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        popularity.snp.makeConstraints { make in
            make.top.equalTo(voteAverageLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        releaseDate.snp.makeConstraints { make in
            make.top.equalTo(popularity.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        isAdult.snp.makeConstraints { make in
            make.top.equalTo(releaseDate.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        originalLanguage.snp.makeConstraints { make in
            make.top.equalTo(isAdult.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(originalLanguage.snp.bottom).offset(16)
        }

                // Scroll View Constraints
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func bindViewModel() {
        viewModel.movieDetails
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] details in
                // Load the poster image
                if let backdropPath = (details?.backdropPath ?? details?.posterPath),
                   let posterURL = URL(string: "https://image.tmdb.org/t/p/w1280" + backdropPath) {
                    self?.backgroundImageView.af.setImage(withURL: posterURL)
                }
                
                self?.titleLabel.text = details?.title
                self?.overviewLabel.text = details?.overview
                
                if let voteAverage = details?.voteAverage {
                    self?.voteAverageLabel.text = "Vote Average: \(voteAverage)"
                } else {
                    self?.voteAverageLabel.text = "Vote Average: N/A"
                }

//                self?.voteAverageLabel.text = "Vote Average: \(details?.voteAverage)"
                if let releaseDate = details?.releaseDate {
                    self?.releaseDate.text = "Release Date: \(releaseDate)"
                } else {
                    self?.releaseDate.text = "Release Date: N/A"
                }

                if let popularity = details?.popularity {
                    self?.popularity.text = "Popularity rate: \(popularity)"
                } else {
                    self?.popularity.text = "Popularity rate: N/A"
                }
                let adultContent: String = (details?.adult == true) ? "Yes" : "No"
                self?.isAdult.text = "Adult content: \(adultContent)"
                if let originalLanguage = details?.originalLanguage {
                    self?.originalLanguage.text = "Original Language: \(originalLanguage)"
                } else {
                    self?.originalLanguage.text = "Original Language: N/A"
                }
            })
                    .disposed(by: disposeBag)
    }
}
