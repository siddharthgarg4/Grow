//
//  CompanyInformationViewController.swift
//  EcoHack
//
//  Created by Siddharth Garg on 2019-03-09.
//  Copyright © 2019 GreenDreamTeam. All rights reserved.
//

import UIKit
import Cosmos
import TinyConstraints

class CompanyInformationViewController: UIViewController {

    var _companyLabel:String = ""
    var _descriptionLabel:String = ""
    var _numberEndorsements: Int = 0
    
    @IBOutlet weak var endorseButton: UIButton!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var ratingStars: CosmosView!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        endorseButton.layer.borderWidth = 1
        endorseButton.layer.borderColor = UIColor(red:0.47, green:0.47, blue:0.47, alpha:1.0).cgColor
        
        companyLabel.text = _companyLabel
        descriptionLabel.text = _descriptionLabel
    }

}
