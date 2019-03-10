//
//  challengePopUpView.swift
//  EcoHack
//
//  Created by Siddharth Garg on 2019-03-09.
//  Copyright © 2019 GreenDreamTeam. All rights reserved.
//

import UIKit

class challengePopUpView: UIView {

    @IBOutlet weak var challengeLabel: UILabel!
    @IBOutlet weak var challengeImage: UIImageView!
    @IBOutlet weak var descriptionChallengeLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
