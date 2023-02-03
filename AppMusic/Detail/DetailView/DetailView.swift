//
//  DetailView.swift
//  AppMusic
//
//  Created by Natanael Alves Pereira on 31/01/23.
//

import UIKit

class DetailView: UIView {

    var cardModel: CardViewModel?
    var navBarTopAnchor: NSLayoutConstraint?
    
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
        let view = CustomCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionsView.updateLayout(for: .full)
        view.cardContainerView.layer.cornerRadius = 0.00
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
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(cardView)
        self.scrollView.addSubview(self.tableView)
        self.addSubview(self.closeBtn)
    }
    
    private func setUpConstraints() {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap ({$0 as? UIWindowScene})
            .first?.windows.filter({$0.isKeyWindow}).first
        
        let topPading = window?.safeAreaInsets.top
        print(topPading)
        
        self.scrollView.pin(to: self)
        
        NSLayoutConstraint.activate([
            self.cardView.topAnchor.constraint(equalTo: self.scrollView.topAnchor,constant: -(topPading ?? 0)),
            self.cardView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.cardView.heightAnchor.constraint(equalToConstant: 500),
            self.cardView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
        
            self.tableView.topAnchor.constraint(equalTo: self.cardView.topAnchor),
            self.tableView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.tableView.heightAnchor.constraint(equalToConstant: CGFloat((80 * (cardModel?.cardList?.count ?? 0)) + 20)),
            self.tableView.widthAnchor.constraint(equalToConstant: self.frame.size.width),
            self.tableView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            
        ])
    }
}