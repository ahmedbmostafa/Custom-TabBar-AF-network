//
//  MyHeaderClass.swift
//  taskdemo
//
//  Created by ahmed mostafa on 11/30/20.
//

import UIKit

class MyHeaderClass: UICollectionReusableView {
    
    
    let leftheaderLbl: UILabel = {
        let Lbl = UILabel()
        Lbl.font = UIFont.boldSystemFont(ofSize: 17)
        return Lbl
    }()
    
    let rightheaderLbl: UILabel = {
        let Lbl = UILabel()
        Lbl.text = "View all"
        Lbl.font = UIFont.boldSystemFont(ofSize: 17)
        return Lbl
    }()
    
    let showBtn: UIButton = {
        let Btn = UIButton(type: .system)
        
        return Btn
    }()
    
    let img: UIImageView = {
        let img = UIImageView()
        
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        img.widthAnchor.constraint(equalToConstant: 30).isActive = true
        img.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        let leftStackView = UIStackView(arrangedSubviews: [
            img, leftheaderLbl
        ])
        leftStackView.spacing = 12
        
        let rightStackView = UIStackView(arrangedSubviews: [
            rightheaderLbl, showBtn
        ])
        
        rightStackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [
            leftStackView, rightStackView
        ])
        
        stackView.spacing = 12
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
