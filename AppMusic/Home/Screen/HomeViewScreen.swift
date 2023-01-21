//
//  HomeViewScreen.swift
//  AppMusic
//
//  Created by Natanael Alves Pereira on 08/01/23.
//

import UIKit

class HomeViewScreen: UIView {

    lazy var tableView: UITableView = {
       let tv = UITableView()
        tv.separatorStyle = .none
        tv.tableFooterView = UIView()
        tv.showsVerticalScrollIndicator = false
        tv.register(CardViewTableViewCell.self, forCellReuseIdentifier: CardViewTableViewCell.identifier)
        return tv
    }()
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tableView)
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        self.tableView.pin(to: self)
    }
}
