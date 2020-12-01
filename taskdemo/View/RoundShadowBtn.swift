//
//  RoundShadowBtn.swift
//  taskdemo
//
//  Created by ahmed mostafa on 12/1/20.
//

import UIKit

class RoundedShadowBtn: UIButton {

    var originalSize: CGRect?
    
    func setupView() {
        originalSize = self.frame
        self.layer.cornerRadius = 30
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize.zero
    }

    override func awakeFromNib() {
        setupView()
    }
}
