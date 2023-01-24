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

        initDefault(font: UIFont.systemFont(ofSize: 17, weight: .semibold), textColor: .white, textAligment: NSTextAlignment.natural)
    }

    
    init( font: UIFont, textColor: UIColor, textAligment: NSTextAlignment) {
        super.init(frame: .zero)
        initDefault(font: font, textColor: textColor, textAligment: textAligment)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault(font: UIFont , textColor: UIColor, textAligment: NSTextAlignment) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAligment
    }
}
