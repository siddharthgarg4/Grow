//
//  CollectionViewCell.swift
//  EcoHack
//
//  Created by Siddharth Garg on 2019-03-10.
//  Copyright © 2019 GreenDreamTeam. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var companyInfo: UIView!
    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var descriptionCompany: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
