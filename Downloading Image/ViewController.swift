//
//  ViewController.swift
//  Downloading Image
//
//  Created by Mengying Feng on 13/12/2015.
//  Copyright © 2015 Mengying Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        let url = NSURL(string: "http://blog.iconfinder.com/wp-content/uploads/2013/11/star-wars.png")
        let session = NSURLSession.sharedSession()
        let urlRequest = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            if error != nil {
                print(error)
            }else{
                if let sw = UIImage(data: data!) {
//                    self.imageView.image = sw
                    
                    var documentsDirectory:String?
                    
                    var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
                    
                    if paths.count > 0 {
                        documentsDirectory = paths[0] as? String
                        
                        var savePath = documentsDirectory! + "/sw.jpg"
                        
                        NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                        
                        self.imageView.image = UIImage(named: savePath)
                    }
                }
                
                
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

