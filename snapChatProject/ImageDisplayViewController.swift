//
//  ImageDisplayViewController.swift
//  snapChatProject
//
//  Created by David Fang on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImageDisplayViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var displayedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = displayedImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func closeImage(_ sender: Any) {
        performSegue(withIdentifier: "unwindToFeeds", sender: self)
    }

}
