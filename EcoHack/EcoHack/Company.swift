//
//  Company.swift
//  EcoHack
//
//  Created by Andrew Drury on 2019-03-09.
//  Copyright © 2019 GreenDreamTeam. All rights reserved.
//

import UIKit

class Company: UIViewController {

    @IBOutlet weak var imageScroll: UIScrollView!
    var images = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images = [#imageLiteral(resourceName: "9Afcb3F653D742F99593Abafaa216739"),#imageLiteral(resourceName: "consciousbychloePelaCaseCompostableBiodegradablePlasticFreeZeroWastePhoneCase13"), #imageLiteral(resourceName: "consciousbychloePelaCaseCompostableBiodegradablePlasticFreeZeroWastePhoneCase61"), #imageLiteral(resourceName: "consciousbychloePelaCaseCompostableBiodegradablePlasticFreeZeroWastePhoneCase11")]
        
        for i in 0..<images.count {
            let imageView = UIImageView()
            let x = self.view.frame.size.width * CGFloat(i)
            imageView.frame = CGRect(x: x, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            imageView.contentMode = .scaleAspectFit
            imageView.image = images[i]
            
            imageScroll.contentSize.width = imageScroll.frame.size.width * CGFloat(i + 1)
            imageScroll.addSubview(imageView)
        }
    }

}
