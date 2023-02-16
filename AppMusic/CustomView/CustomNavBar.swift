//
//  CustomNavBar.swift
//  AppMusic
//
//  Created by Natanael Alves Pereira on 15/02/23.
//

import UIKit

class CustomNavBar: UIView {

    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var cardTitle: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var featureLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var cardImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var overlayView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.7)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.addSubview(self.cardImage)
        self.addSubview(self.overlayView)
        self.addSubview(self.categoryLabel)
        self.addSubview(self.cardTitle)
        self.addSubview(self.featureLabel)
    }
    
    private func setupConstraints() {
        
        self.cardImage.pin(to: self)
        self.overlayView.pin(to: self)
        
        NSLayoutConstraint.activate([
            self.categoryLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            self.categoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.categoryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.cardTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.cardTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            self.cardTitle.topAnchor.constraint(equalTo: self.categoryLabel.bottomAnchor, constant: 5),
            
            self.featureLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.featureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.featureLabel.topAnchor.constraint(equalTo: self.cardTitle.bottomAnchor, constant: 5),
            
        ])
    }
    
    public func setupView(data: CardViewModel) {
        self.cardTitle.text = data.cardTitle
        self.categoryLabel.text = data.categoryName
        self.cardImage.image = UIImage(named: data.cardImage ?? "")
        self.featureLabel.attributedText = .featureText(data.likeCount ?? "", data.duration ?? "")
    }
}
