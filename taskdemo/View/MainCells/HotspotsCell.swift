//
//  HotspotsCell.swift
//  taskdemo
//
//  Created by ahmed mostafa on 11/30/20.
//

import UIKit
import SDWebImage

class HotspotsCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let service = Service()    
    var myhotspotArray = [Myhot_spot]()
    
    @IBOutlet weak var hotspotCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        hotspotCollectionView.dataSource = self
        hotspotCollectionView.decelerationRate = .fast
        myAPICall()
    }
    
    func myAPICall(){
        Service.shared.Getmydata { (data, error) in
            if let data = data {
                let mydata = data.data?.hotSpots
                print("count of data is    \(mydata!.count)")
                self.myhotspotArray = mydata!
                self.hotspotCollectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("count of arrray is    \(myhotspotArray.count)")
        return myhotspotArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotspotsHorizontalCell", for: indexPath) as! HotspotsHorizontalCell
        
        DispatchQueue.main.async {
            cell.nameLbl.text = self.myhotspotArray[indexPath.row].name
            cell.categoryNameLbl.text = self.myhotspotArray[indexPath.row].neighborhood?.name
            let imagesArray = [self.myhotspotArray[indexPath.row].photos]
            
            for images in imagesArray {
                if self.myhotspotArray.count != images?.count {
                    
                    cell.img.downloaded(from: (images?.first) ?? "")
                    
                    return
                } else {
                    cell.img.downloaded(from: (images?.first) ?? "")
                }
            }
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        
        return CGSize(width: 150, height: 195)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
