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
    
    var picture: [[String: Any]] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")
        detailimageView.af_setImage(withURL: url!)
    }
    


override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
}



}
