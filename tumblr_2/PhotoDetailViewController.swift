//
//  PhotoDetailViewController.swift
//  tumblr_2
//
//  Created by Alicia Washington on 2/9/18.
//  Copyright © 2018 Alicia Washington. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var detailimageView: UIImageView!
    
    var image: UIImageView
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
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
