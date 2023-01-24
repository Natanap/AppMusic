//
//  LabelDefault.swift
//  AppMusic
//
//  Created by Natanael Alves Pereira on 24/01/23.
//

import UIKit

class LabelDefault: UILabel {

    init() {
        super.init(frame: .zero)
        
        initDefault(text: "" , font: UIFont.systemFont(ofSize: 17, weight: .semibold), textColor: .black, textAligment: textAlignment)
    }
    
    
    init(text: String, font: UIFont, textColor: UIColor, textAligment: NSTextAlignment?) {
        super.init(frame: .zero)
        initDefault(text: text, font: font, textColor: textColor, textAligment: textAligment)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(text: String, font: UIFont , textColor: UIColor, textAligment: NSTextAlignment?) {
        self.text = text
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .black
        self.font = font
        self.textAlignment = textAlignment
    }
}
