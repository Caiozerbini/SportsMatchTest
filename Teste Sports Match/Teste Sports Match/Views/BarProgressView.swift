//
//  BarProgressView.swift
//  Teste Sports Match
//
//  Created by Caio Carneiro on 26/10/22.
//

import UIKit
import Foundation

class BarProgressView: UIProgressView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.layer.borderWidth = 0.2
        self.layer.borderColor = UIColor.white.cgColor
        self.tintColor = .purple
        self.transform = CGAffineTransform(scaleX: 1,y: 8)
        self.layer.cornerCurve = .continuous
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
