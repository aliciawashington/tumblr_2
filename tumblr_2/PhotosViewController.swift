//
//  PhotosViewController.swift
//  tumblr_2
//
//  Created by Alicia Washington on 2/7/18.
//  Copyright © 2018 Alicia Washington. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotosViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var posts: [[String: Any]] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data,
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                print(dataDictionary)
                
                let responseDictionary = dataDictionary["response"] as! [String: Any]
                
                self.posts = responseDictionary["posts"] as! [[String: Any]]
                self.tableView.reloadData()
            }
        }
        task.resume()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        let cell = sender as! UITableViewCell
        
        if let indexPath = tableView.indexPath(for: cell){
            let pic = posts[indexPath.row]
            let photos = pic["photos"] as! [[String: Any]]
            let photo = photos[0]
            let originalSize = photo["original_size"] as! [String: Any]
            let urlString = originalSize["url"] as! String
            let url = URL(string: urlString)
            
            let detailViewController = segue.destination as! PhotoDetailViewController
            detailViewController.photoURL = url!
            

        }
        
        
        
    }
    
    
    
    func fetchMovies(){
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=f9240b3f5b8aeb07ae463caac20c17a9")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            //This runs the network request
            if let error = error {
                print(error.localizedDescription)
            }else if let data = data{
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.posts = movies
                self.tableView.reloadData()
                //self.refreshControl.endRefreshing()
                
            }
            
        }
        task.resume()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let post = posts[indexPath.row]
        let photos = post["photos"] as! [[String: Any]]
        
        let photo = photos[0]
        let originalSize = photo["original_size"] as! [String: Any]
        let urlString = originalSize["url"] as! String
        let url = URL(string: urlString)
        
        
        
        cell.postimageview.af_setImage(withURL: url!)
        
        
        
        return cell
    }
}
