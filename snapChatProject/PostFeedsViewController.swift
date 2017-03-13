//
//  PostFeedsViewController.swift
//  snapChatProject
//
//  Created by David Fang on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class PostFeedsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var postingThreadName: UILabel!
    
    var selectedFeedList: [ImageFeedTuple]?
    var imageToPost: UIImage?
    var postSuccessful: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pickFeedCell", for: indexPath) as! ThreadViewCell
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.threadName.text = threadNames[indexPath.row]

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let threadName = threadNames[indexPath.row]
        postingThreadName.text = threadName
        selectedFeedList = threads[threadName]
    }
    
    
    @IBAction func postToThread(_ sender: Any) {
        if let image = imageToPost {
            let imageTup = ImageFeedTuple(poster: "David", posttime: NSDate(), image: image)
            selectedFeedList?.append(imageTup)
            postSuccessful = true
        } else {
            postSuccessful = false
        }
        
        performSegue(withIdentifier: "unwindToImagePicker", sender: self)
    }
}
