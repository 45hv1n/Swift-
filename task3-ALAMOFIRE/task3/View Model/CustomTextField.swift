//
//  CustomTextField.swift
//  task3
//
//  Created by Ashvin Alva on 18/07/23.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    private var padding: CGFloat = 20 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    let bottomLayer = CALayer()
    
    required init?(coder : NSCoder){
        super.init(coder: coder)
        
        setUpUnderlinedTextField()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bottomLayer.frame = CGRect(x: padding/2, y: self.bounds.height - 2 , width: bounds.width - padding , height: 2)
    }
    
    func setUpUnderlinedTextField() {
        self.backgroundColor = .clear
        bottomLayer.backgroundColor = UIColor.white.cgColor
        self.layer.addSublayer(bottomLayer)
    }
}
