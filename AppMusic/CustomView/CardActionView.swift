//
//  CardActionView.swift
//  AppMusic
//
//  Created by Natanael Alves Pereira on 24/01/23.
//

import UIKit

class CardActionView: UIView {
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var downloadView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var notInterestedView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var playView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var likeView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var moreView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var downloadBtn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 22.5
        btn.setBackgroundImage(UIImage(named: "download")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var notInterestedBtn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 22.5
        btn.setBackgroundImage(UIImage(named: "restrict")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var playBtn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 35
        btn.setBackgroundImage(UIImage(named: "playBtn")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .black
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var likeBtn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 22.5
        btn.setBackgroundImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.clipsToBounds = true
        return btn
    }()
    
    lazy var moreBtn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 22.5
        btn.setBackgroundImage(UIImage(named: "like")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.clipsToBounds = true
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.notInterestedView)
        self.stackView.addArrangedSubview(self.playView)
        self.stackView.addArrangedSubview(self.likeView)
        
        self.downloadView.addSubview(self.downloadBtn)
        self.notInterestedView.addSubview(self.notInterestedBtn)
        self.playView.addSubview(self.playBtn)
        self.likeView.addSubview(self.likeBtn)
        self.moreView.addSubview(self.moreBtn)
    }
    
    private func setupConstraints() {
        
        self.stackView.pin(to: self)
        NSLayoutConstraint.activate([
            self.downloadBtn.centerXAnchor.constraint(equalTo: self.downloadView.centerXAnchor),
            self.downloadBtn.centerYAnchor.constraint(equalTo: self.downloadView.centerYAnchor),
            self.downloadBtn.widthAnchor.constraint(equalToConstant: 45),
            self.downloadBtn.heightAnchor.constraint(equalToConstant: 45),
        
            self.notInterestedBtn.centerXAnchor.constraint(equalTo: self.notInterestedView.centerXAnchor),
            self.notInterestedBtn.centerYAnchor.constraint(equalTo: self.notInterestedView.centerYAnchor),
            self.notInterestedBtn.widthAnchor.constraint(equalToConstant: 45),
            self.notInterestedBtn.heightAnchor.constraint(equalToConstant: 45),
            
            self.playBtn.centerXAnchor.constraint(equalTo: self.playView.centerXAnchor),
            self.playBtn.centerYAnchor.constraint(equalTo: self.playView.centerYAnchor),
            self.playBtn.widthAnchor.constraint(equalToConstant: 70),
            self.playBtn.heightAnchor.constraint(equalToConstant: 70),
            
            self.likeBtn.centerXAnchor.constraint(equalTo: self.likeView.centerXAnchor),
            self.likeBtn.centerYAnchor.constraint(equalTo: self.likeView.centerYAnchor),
            self.likeBtn.widthAnchor.constraint(equalToConstant: 45),
            self.likeBtn.heightAnchor.constraint(equalToConstant: 45),
            
            self.moreBtn.centerXAnchor.constraint(equalTo: self.moreView.centerXAnchor),
            self.moreBtn.centerYAnchor.constraint(equalTo: self.moreView.centerYAnchor),
            self.moreBtn.widthAnchor.constraint(equalToConstant: 45),
            self.moreBtn.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
    
    public func updateLayout(for mode: ViewMode){
        switch mode {
        case .full:
            self.downloadBtn.isHidden = false
            self.moreView.isHidden = false
            self.stackView.addArrangedSubview(self.downloadView)
            self.stackView.addArrangedSubview(self.notInterestedView)
            self.stackView.addArrangedSubview(self.playView)
            self.stackView.addArrangedSubview(self.likeView)
            self.stackView.addArrangedSubview(self.moreView)
        case .card:
            self.downloadView.isHidden = true
            self.moreView.isHidden = true
            self.stackView.removeArrangedSubview(self.downloadView)
            self.stackView.removeArrangedSubview(self.moreView)
        }
    }
}
