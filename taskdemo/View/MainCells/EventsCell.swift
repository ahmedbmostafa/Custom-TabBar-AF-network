//
//  EventsCell.swift
//  taskdemo
//
//  Created by ahmed mostafa on 11/30/20.
//

import UIKit

class EventsCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let service = Service()
    var myeventArray = [Myevents]()
    
    @IBOutlet weak var EventsCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        EventsCollectionView.dataSource = self
        EventsCollectionView.decelerationRate = .fast
        myAPICall()

    }
    
    func myAPICall(){
        Service.shared.Getmydata { (data, error) in
            if let data = data {
                let mydata = data.data?.events
                print("count of data is    \(mydata!.count)")
                self.myeventArray = mydata!
                self.EventsCollectionView.reloadData()
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myeventArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventsHorizontalCell", for: indexPath) as! EventsHorizontalCell
        
        DispatchQueue.main.async {
            
            cell.nameLbl.text = self.myeventArray[indexPath.row].name
            let categoriesArray = [self.myeventArray[indexPath.row].categories]
            for data in categoriesArray {
                
                if self.myeventArray.count != data.count {
                    
                    cell.categoryNameLbl.text = data.first?.name
                    cell.img.downloaded(from: (data.first?.icon_image_url) ?? "")
                    return
                } else {
                    cell.categoryNameLbl.text = data[indexPath.row].name ?? "None"
                    cell.img.downloaded(from: (data[indexPath.row].icon_image_url)!)
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
