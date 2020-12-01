//
//  HomeVC.swift
//  taskdemo
//
//  Created by ahmed mostafa on 11/30/20.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    let collectionViewHeaderReuseIdentifier = "MyHeaderClass"
    let categories = ["Hotspots", "Events", "Attraction"]
    let imgArray = ["hotspot_icon", "events_icon", "attarctions_icon"]
    
    @IBOutlet weak var maincollectionview: UICollectionView!
    
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maincollectionview.register(MyHeaderClass.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: collectionViewHeaderReuseIdentifier)
        
        maincollectionview.decelerationRate = .fast
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotspotsCell", for: indexPath) as! HotspotsCell
            return cell
            
        }
        else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsCell", for: indexPath) as! EventsCell
            return cell
            
        }else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AttractionsCell", for: indexPath) as! AttractionsCell
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: view.frame.width, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 70, right: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: collectionViewHeaderReuseIdentifier, for: indexPath) as! MyHeaderClass
        
        if indexPath.section == 0 {
            headerView.showBtn.addTarget(self, action: #selector(handleExpand), for: .touchUpInside)
        } else if indexPath.section == 1 {
            headerView.showBtn.addTarget(self, action: #selector(handleExpandSecond), for: .touchUpInside)
            
        }else if indexPath.section == 2 {
            headerView.showBtn.addTarget(self, action: #selector(handleExpandThird), for: .touchUpInside)
            
        }
        
        headerView.leftheaderLbl.text = categories[indexPath.section]
        
        headerView.img.image = UIImage(named: imgArray[indexPath.section])
        headerView.showBtn.setBackgroundImage(#imageLiteral(resourceName: "view_all_icon"), for: .normal)
        
        return headerView
    }
    
    @objc func handleExpand() {
        
        print("Show All Hotspots")
        
    }
    @objc func handleExpandSecond() {
        
        print("Show All Events")
        
    }
    
    @objc func handleExpandThird() {
        
        print("Show All Attractions")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
    
}
