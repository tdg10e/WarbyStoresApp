//
//  UIView.swift
//  WarbyAssessment
//
//  Created by Tremaine Grant on 6/21/19.
//

import Foundation
import UIKit

extension UIView {
    func addShadow() {
        var shadowLayer = CAShapeLayer()
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 4
        
    }
    
    func roundCorners() {
        self.layer.cornerRadius = 10
    }
}

