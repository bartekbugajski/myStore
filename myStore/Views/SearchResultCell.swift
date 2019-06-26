//
//  SearchResultCell.swift
//  myStore
//
//  Created by Bartek Bugajski on 03/06/2019.
//  Copyright © 2019 BB. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var appResult: Result! {
        didSet {
        nameLabel.text = appResult.trackName
        artistLabel.text = appResult.artistName
        genreLabel.text = appResult.primaryGenreName
        
        let url = URL(string: appResult.artworkUrl100)
        itemIconImageView.sd_setImage(with: url)
        screenshot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
        if appResult.screenshotUrls.count > 1 {
        screenshot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
        }
        if appResult.screenshotUrls.count > 2 {
        screenshot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
        }
        }
    }
    
    let itemIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        iv.widthAnchor.constraint(equalToConstant: 60).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 60).isActive = true
        iv.layer.cornerRadius = 9
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let artistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    lazy var screenshot1ImageView = self.createScreenshotImageView()
    lazy var screenshot2ImageView = self.createScreenshotImageView()
    lazy var screenshot3ImageView = self.createScreenshotImageView()
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 0.4
        imageView.layer.borderColor =  UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.layer.cornerRadius = 9
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 12
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 1, alpha: 1)
    
        let infoStackView = UIStackView(arrangedSubviews: [
            itemIconImageView, VerticalStackView(arrangedSubviews: [nameLabel, artistLabel, genreLabel]), getButton
            ])
        infoStackView.spacing = 16
        infoStackView.alignment = .center
        
        let screenshotsStackView = UIStackView(arrangedSubviews: [
            screenshot1ImageView, screenshot2ImageView, screenshot3ImageView
            ])
        screenshotsStackView.spacing = 12
        screenshotsStackView.distribution = .fillEqually
        
        let overallStackView = VerticalStackView(arrangedSubviews: [infoStackView, screenshotsStackView], spacing: 16)
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
}
