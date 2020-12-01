//
//  MainVC.swift
//  taskdemo
//
//  Created by ahmed mostafa on 11/30/20.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabBar: CustomTabbarr!
    
    var HomeVC: UIViewController!
    var SearchVC: UIViewController!
    var CompienVC: UIViewController!
    var ProfileVC: UIViewController!
 
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tabBar.delegate = self
        
        // creating VCs:
        let storyborad = UIStoryboard(name: "Main", bundle: nil)
        HomeVC = storyborad.instantiateViewController(withIdentifier: "HomeVC")
        SearchVC = storyborad.instantiateViewController(withIdentifier: "SearchVC")
        CompienVC = storyborad.instantiateViewController(withIdentifier: "CompienVC")
        ProfileVC = storyborad.instantiateViewController(withIdentifier: "ProfileVC")

        viewControllers = [HomeVC, SearchVC, CompienVC, ProfileVC]
        didPressOnButton(type: .home)
        
    }
 
}

extension MainVC: CustomTabBarDelegate {
    func didPressOnButton(type: CustomTabbarr.CustomTabBarButtons) {
        let previousIndex = selectedIndex
        selectedIndex = type.rawValue
        
        let previousVC = viewControllers[previousIndex]
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        let vc = viewControllers[selectedIndex]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
    func didPressOnBellMan() {
        let BellManVC = self.storyboard?.instantiateViewController(withIdentifier: "BellManVC") as! BellManVC
        self.present(BellManVC, animated: true)
    }
}
