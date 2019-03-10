//
//  Company.swift
//  EcoHack
//
//  Created by Andrew Drury on 2019-03-09.
//  Copyright © 2019 GreenDreamTeam. All rights reserved.
//

import UIKit

class Company: UIViewController {

    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.isPagingEnabled = true
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.frame = CGRect(x: 0, y: 150, width: UIScreen.main.bounds.width, height: 282)
        return scroll
    }()
    
    var imageArray = [UIImage]()
    
    @IBAction func backBtn(_ sender: Any) {
        present(ArScannerViewController(), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        
        imageArray = [#imageLiteral(resourceName: "9Afcb3F653D742F99593Abafaa216739"), #imageLiteral(resourceName: "consciousbychloePelaCaseCompostableBiodegradablePlasticFreeZeroWastePhoneCase13"), #imageLiteral(resourceName: "consciousbychloePelaCaseCompostableBiodegradablePlasticFreeZeroWastePhoneCase61"), #imageLiteral(resourceName: "consciousbychloePelaCaseCompostableBiodegradablePlasticFreeZeroWastePhoneCase11")]
        
        setupImages(imageArray)
    }
    
    func setupImages(_ images: [UIImage]){
        for i in 0..<images.count {
            let imageView = UIImageView()
            imageView.image = images[i]
            let xPosition = UIScreen.main.bounds.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            imageView.contentMode = .scaleAspectFit
            
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
            scrollView.addSubview(imageView)
        }
    }
}
