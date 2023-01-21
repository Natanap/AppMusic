//
//  HomeViewController.swift
//  AppMusic
//
//  Created by Natanael Alves Pereira on 08/01/23.
//

import UIKit

class HomeViewController: UIViewController {

    var screen: HomeViewScreen?
    
    override func loadView() {
        super.loadView()
        self.screen = HomeViewScreen()
        self.screen?.configTableViewProtocols(delegate: self, dataSource: self)
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardViewTableViewCell.identifier, for: indexPath) as? CardViewTableViewCell
        cell?.setupCell(data: CardData[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
}
