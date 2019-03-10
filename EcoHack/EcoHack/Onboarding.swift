//
//  Onboarding.swift
//  EcoHack
//
//  Created by Andrew Drury on 2019-03-09.
//  Copyright © 2019 GreenDreamTeam. All rights reserved.
//

import UIKit

class Onboarding: UIViewController {

    @IBAction func Skip(_ sender: Any) {
        present(Company(), animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
