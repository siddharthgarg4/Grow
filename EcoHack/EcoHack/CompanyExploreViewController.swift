//
//  CompanyExploreViewController.swift
//  EcoHack
//
//  Created by Siddharth Garg on 2019-03-10.
//  Copyright © 2019 GreenDreamTeam. All rights reserved.
//

import UIKit

class CompanyExploreViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let cellIdentifier = "CollectionViewCell"
    let companyNum = 20
    
    @IBOutlet weak var companyCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        companyCollection.delegate = self
        companyCollection.dataSource = self
        let nibCell = UINib(nibName: cellIdentifier, bundle: nil)
        companyCollection.register(nibCell, forCellWithReuseIdentifier: cellIdentifier)

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companyNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
        //set the labels and other things here when time
       if (indexPath.item % 2 == 0) {
            cell.companyInfo.trailingAnchor.constraint(equalTo: cell.companyImage.trailingAnchor).isActive = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        self.navigationController?.pushViewController(Company(), animated: true)
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
