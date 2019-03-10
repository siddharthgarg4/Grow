//
//  ExploreViewController.swift
//  EcoHack
//
//  Created by Siddharth Garg on 2019-03-09.
//  Copyright © 2019 GreenDreamTeam. All rights reserved.
//

import UIKit
import ARKit




class ExploreViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var companyCollection: UICollectionView!
    
    let cellIdentifier = "CompanyCollectionViewCell"
    let companyNum = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        companyCollection.delegate = self
        companyCollection.dataSource = self
        let nibCell = UINib(nibName: cellIdentifier, bundle: nil)
        companyCollection.register(nibCell, forCellWithReuseIdentifier: cellIdentifier)
        let headerView = UINib(nibName: "ExploreHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! UIView
        companyCollection.addSubview(headerView)
        companyCollection.contentInset.top = 180
    
        headerView.frame = CGRect(x: 0,y: -180, width: companyCollection.frame.size.width, height: 180)
    }
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companyNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CompanyCollectionViewCell
        //set the labels and other things here when time
        if (indexPath.item % 2 != 0) {
            cell.informationView.trailingAnchor.constraint(equalTo: cell.companyImage.trailingAnchor).isActive = true
        } else {
            cell.informationView.leadingAnchor.constraint(equalTo: cell.companyImage.leadingAnchor).isActive = true
        }
        return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    // handle tap events
    print("You selected cell #\(indexPath.item)!")

    }
}
