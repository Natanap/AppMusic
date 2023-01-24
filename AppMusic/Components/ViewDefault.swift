//
//  ViewDefault.swift
//  AppMusic
//
//  Created by Natanael Alves Pereira on 24/01/23.
//

import Foundation
import UIKit

class ViewDefault: UIView {
    
    init(backgroundColor: UIColor) {
        super.init(frame: .zero)
        initDefault()
    }
    
    public func initDefault(){
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
