//
//  ImageFeedTableViewController.swift
//  snapChatProject
//
//  Created by David Fang on 3/3/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImageFeedTableViewController: UITableViewController {
    
    var imageToDisplay: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return threadNames.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let threadName = threadNames[section]
        
        if let threadList = threads[threadName] {
            return threadList.count
        } else {
            print("ERROR: Could not find key \(threadName) in threads")
            return 0
        }
    }


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imgFeedCell", for: indexPath) as! ImageFeedViewCell
        let threadName = threadNames[indexPath.section]
        let imageFeeds = threads[threadName]
        
        if let imageFeedInfo = imageFeeds?[indexPath.row] {
            let minutesPassed = Int(Date().timeIntervalSince(imageFeedInfo.posttime as Date) / 60) % 60
            cell.posterName.text = imageFeedInfo.poster
            cell.timeAgo.text = String.init(format: "%d minute(s) ago", minutesPassed)
            cell.hasReadImage.image = #imageLiteral(resourceName: "unread")
        }
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // FIX ME
        
    }
    
}
