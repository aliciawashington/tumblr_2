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
    
    var pic: [String: Any]!
    var photoURL: URL!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let photos = pic["photos"] as! [[String: Any]]
        let photo = photos[0]
        let originalSize = photo["original_size"] as! [String: Any]
        let urlString = originalSize["url"] as! String
        let url = URL(string: urlString)
        
        
        detailimageView.af_setImage(withURL: url!)
    }
    


override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
}



}
