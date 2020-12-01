//
//  CustomTabbarr.swift
//  taskdemo
//
//  Created by ahmed mostafa on 11/30/20.
//

import UIKit

protocol CustomTabBarDelegate: class {
    func didPressOnButton(type: CustomTabbarr.CustomTabBarButtons)
    func didPressOnBellMan()
}

class CustomTabbarr: UIView {
    enum CustomTabBarButtons: Int {
        case home
        case search
        case combine
        case profile
    }
    
    weak var delegate: CustomTabBarDelegate?
    
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var compienBtn: UIButton!
    @IBOutlet weak var profileBtn: UIButton!
    
    @IBOutlet weak var hotspotBtn: RoundedShadowBtn!
    @IBOutlet weak var eventsBtn: RoundedShadowBtn!
    @IBOutlet weak var attractionBtn: RoundedShadowBtn!
    @IBOutlet weak var locationBtn: RoundedShadowBtn!
    @IBOutlet weak var bellmanBtn: UIButton!
    
    @IBOutlet var containerView: UIView!
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("It is working")
        commonInit()
        colapse()
    
        homeBtn.setImage(#imageLiteral(resourceName: "Home_grey_bottom_icon"), for: .normal)
        searchBtn.setImage(#imageLiteral(resourceName: "search_grey_bottom_icon"), for: .normal)
        compienBtn.setImage(#imageLiteral(resourceName: "Group 100"), for: .normal)
        profileBtn.setImage(#imageLiteral(resourceName: "profile_grey_bottom_icon"), for: .normal)
    }
    
    func commonInit(){
        if let nibView = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as? UIView{
            nibView.frame = self.bounds
            self.addSubview(nibView)
            containerView = nibView
        }
    }
    
    @IBAction func homeBtnPressed(_ sender: Any) {
        delegate?.didPressOnButton(type: .home)
        toggelBtn(button: sender as! UIButton, onImage: #imageLiteral(resourceName: "Home_bottom_icon"), offImage: #imageLiteral(resourceName: "Home_grey_bottom_icon"))
    }
    
    @IBAction func searchBtnPressed(_ sender: Any) {
        delegate?.didPressOnButton(type: .search)
        toggelBtn(button: sender as! UIButton, onImage: #imageLiteral(resourceName: "location_search_icon"), offImage: #imageLiteral(resourceName: "search_grey_bottom_icon"))
    }
    
    @IBAction func combineBtnPressed(_ sender: Any) {
        delegate?.didPressOnButton(type: .combine)
        toggelBtn(button: sender as! UIButton, onImage: #imageLiteral(resourceName: "Combined-Shape"), offImage: #imageLiteral(resourceName: "Group 100"))
    }
    
    @IBAction func profileBtnPressed(_ sender: Any) {
        delegate?.didPressOnButton(type: .profile)
        toggelBtn(button: sender as! UIButton, onImage: #imageLiteral(resourceName: "profile_bottom_icon"), offImage: #imageLiteral(resourceName: "profile_grey_bottom_icon"))
    }
    
    @IBAction func bellManBtnPressed(_ sender: Any) {
        print("bellmanBtnpressed")
        // delegate?.didPressOnBellMan()
        if hotspotBtn.transform == .identity {
            self.colapse()
        }else {
            self.expand()
        }
    }
    
    func colapse() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: []) {
            self.hotspotBtn.transform = CGAffineTransform(translationX: 108, y: 1.5)
            self.locationBtn.transform = CGAffineTransform(translationX: -114, y: -2.2)
            self.eventsBtn.transform = CGAffineTransform(translationX: 52, y: 60)
            self.attractionBtn.transform = CGAffineTransform(translationX: -42, y: 60)
            
            self.hotspotBtn.alpha = 0
            self.eventsBtn.alpha = 0
            self.locationBtn.alpha = 0
            self.attractionBtn.alpha = 0
        }
    }
    
    func expand(){
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: []) {
            self.hotspotBtn.transform = .identity
            self.eventsBtn.transform = .identity
            self.locationBtn.transform = .identity
            self.attractionBtn.transform = .identity
            
            self.hotspotBtn.alpha = 1
            self.eventsBtn.alpha = 1
            self.locationBtn.alpha = 1
            self.attractionBtn.alpha = 1
        }
    }
    
    func toggelBtn(button: UIButton, onImage: UIImage, offImage: UIImage) {
        
        if button.currentImage == offImage {
            button.setImage(onImage, for: .normal)
        } else {
            button.setImage(offImage, for: .normal)
        }
    }
}
