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
    
    var photo: [String: Any]?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let photo = photo{
            let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
            detailimageView.af_setImage(withURL: url)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
