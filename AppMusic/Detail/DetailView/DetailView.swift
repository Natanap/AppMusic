//
//  DetailView.swift
//  AppMusic
//
//  Created by Natanael Alves Pereira on 31/01/23.
//

import UIKit

protocol DetailViewDelegate: AnyObject {
    func tappedCloseButton()
    
}
class DetailView: UIView {

    var cardModel: CardViewModel?
    var navBarTopAnchor: NSLayoutConstraint?
    
    private weak var delegate: DetailViewDelegate?
    
    
    lazy var scrollView:UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.autoresizingMask = .flexibleHeight
        view.bounces = false
        view.clipsToBounds = true
        return view
    }()
    
    lazy var cardView: CustomCardView = {
        let view = CustomCardView(mode: .full)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.cardContainerView.layer.cornerRadius = 0.00
        view.setupView(data: self.cardModel ?? CardViewModel())
        return view
    }()
    
    lazy var navBar: CustomNavBar = {
       let view = CustomNavBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.setupView(data: self.cardModel ?? CardViewModel())
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.tableFooterView = UIView()
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.isScrollEnabled = false
        tv.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        tv.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return tv
    }()
    
    lazy var closeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 15
        btn.setBackgroundImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(self.closePressed), for: .touchUpInside)
        return btn
    }()
    
    
    @objc func closePressed() {
        self.delegate?.tappedCloseButton()
    }
    
    init(dataView: CardViewModel?) {
        super.init(frame: CGRect())
        self.cardModel = dataView        
        DispatchQueue.main.async {
            self.setUpView()
            self.setUpConstraints()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.cardView)
        self.scrollView.addSubview(self.tableView)
        self.addSubview(self.navBar)
        self.addSubview(self.closeBtn)
    }
    
    private func setUpConstraints() {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap ({$0 as? UIWindowScene})
            .first?.windows.filter({$0.isKeyWindow}).first
        
        let topPading = window?.safeAreaInsets.top
        print(topPading as Any)
        
        self.scrollView.pin(to: self)
        
        NSLayoutConstraint.activate([
            self.cardView.topAnchor.constraint(equalTo: self.scrollView.topAnchor,constant: -(topPading ?? 0)),
            self.cardView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.cardView.heightAnchor.constraint(equalToConstant: 500),
            self.cardView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
        
            self.tableView.topAnchor.constraint(equalTo: self.cardView.bottomAnchor),
            self.tableView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.tableView.heightAnchor.constraint(equalToConstant: CGFloat((80 * (cardModel?.cardList?.count ?? 0)) + 20)),
            self.tableView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
            self.tableView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            
            self.closeBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.closeBtn.widthAnchor.constraint(equalToConstant: 30),
            self.closeBtn.heightAnchor.constraint(equalToConstant: 30),
            self.closeBtn.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 10),
            
            self.navBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navBar.heightAnchor.constraint(equalToConstant: ((topPading ?? 0.0) + 80)),
            
        ])
        
        self.navBarTopAnchor = self.navBar.topAnchor.constraint(equalTo: self.topAnchor, constant: -((topPading ?? 0.0) + 60))
        self.navBarTopAnchor?.isActive = true
    }
    
    public func configAllDelegates(tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource, scrollViewDelegate: UIScrollViewDelegate, detailViewScreenDelegate: DetailViewDelegate) {
        self.tableView.delegate = tableViewDelegate
        self.tableView.dataSource = tableViewDataSource
        self.scrollView.delegate = scrollViewDelegate
        self.delegate = detailViewScreenDelegate
    }
}
