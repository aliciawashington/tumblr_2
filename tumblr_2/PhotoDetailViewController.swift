//
//  PhotoDetailViewController.swift
//  tumblr_2
//
//  Created by Alicia Washington on 2/9/18.
//  Copyright © 2018 Alicia Washington. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoDetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var detailimageView: UIImageView!
    
    
    var photoURL: URL!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        
        if let url = photoURL{
            detailimageView.af_setImage(withURL: url)
            
        }
    }
    


override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
}



}
