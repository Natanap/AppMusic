//
//  DetailTableViewCell.swift
//  AppMusic
//
//  Created by Natanael Alves Pereira on 10/02/23.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    static public let identifier: String = "DetailTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
