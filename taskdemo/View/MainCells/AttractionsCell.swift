//
//  AttractionsCell.swift
//  taskdemo
//
//  Created by ahmed mostafa on 11/30/20.
//

import UIKit

class AttractionsCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    let service = Service()
    var myattractionArray = [Myattractions]()
    
    @IBOutlet weak var AttractionsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        AttractionsCollectionView.dataSource = self
        AttractionsCollectionView.decelerationRate = .fast
        myAPICall()
    }
    
    func myAPICall(){
        
        Service.shared.Getmydata { (data, error) in
            if let data = data {
                let mydata = data.data?.attractions
                print("count of data is    \(mydata!.count)")
                
                self.myattractionArray = mydata!
                self.AttractionsCollectionView.reloadData()
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myattractionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AttractionsHorizontalCell", for: indexPath) as! AttractionsHorizontalCell
        
        
        DispatchQueue.main.async {
            cell.nameLbl.text = self.myattractionArray[indexPath.row].name
            let categoriesArray = [self.myattractionArray[indexPath.row].categories]
            let imgsArray = [self.myattractionArray[indexPath.row].photos]
            
            for data in categoriesArray {
                if self.myattractionArray.count != data.count {
                    cell.categoryNameLbl.text = data.first?.name
                    return
                } else {
                    cell.categoryNameLbl.text = data[indexPath.row].name ?? "None"
                }
            }
            for data in imgsArray {
                
                if self.myattractionArray.count != data.count {
                    
                    cell.img.downloaded(from: (data.first ?? ""))
                    return
                } else {
                    cell.img.downloaded(from: (data.first ?? ""))
                }
            }
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        
        return CGSize(width: 350, height: 195)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
