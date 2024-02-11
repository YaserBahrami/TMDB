//
//  MovieTableViewCell.swift
//  TMDB
//
//  Created by Yaser on 11.02.2024.
//

import UIKit
import SnapKit
import AlamofireImage



class MovieTableViewCell: UITableViewCell {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.numberOfLines = 0

        return label
    }()

    private let voteLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0


        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(backgroundImageView)
        addSubview(overlayView)
        overlayView.addSubview(titleLabel)
        overlayView.addSubview(voteLabel)
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(200)

        }
        
        overlayView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(80)
            
            
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        voteLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(titleLabel.snp.top).offset(-8)
        }
        
        // Ensure content mode is set to scaleAspectFill for the image view
            backgroundImageView.contentMode = .scaleAspectFill
            // Clip to bounds to make sure the image doesn't exceed the cell boundaries
            backgroundImageView.clipsToBounds = true
        
        titleLabel.numberOfLines = 0
            voteLabel.numberOfLines = 0
        
    }


    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        voteLabel.text = "Rate: \(movie.voteAverage)/10.0"
        
        let str = "https://image.tmdb.org/t/p/w1280" + (movie.backdropPath ?? "\(movie.posterPath ?? "")")
        if let imageUrl = URL(string: str) {
            // Use AlamofireImage to load and cache the image
            print("here")
            print(imageUrl)
            backgroundImageView.af.setImage(withURL: imageUrl)
        }
    }
}
