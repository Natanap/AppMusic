//
//  DetailTableViewCellScrenn.swift
//  AppMusic
//
//  Created by Natanael Alves Pereira on 10/02/23.
//

import UIKit

class DetailTableViewCellScrenn: UIView {
    
    
    lazy var thumbImage: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "demo")
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Teste Nome"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sub Titulo"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .lightGray
        return label
    }()

    lazy var likeBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(named: "love")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .lightGray
        return btn
    }()
    
    
    lazy var moreBtn: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        return btn
    }()
}
