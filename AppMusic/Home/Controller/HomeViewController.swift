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
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }


}

