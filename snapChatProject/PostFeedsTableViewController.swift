//
//  PostFeedsTableViewController.swift
//  snapChatProject
//
//  Created by David Fang on 3/3/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class PostFeedsTableViewController: UITableViewController {

    @IBOutlet weak var footerView: UIView!
    
    var selectedFeedList: [ImageFeedTuple]?
    var isPosting = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshFooter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pickFeedCell", for: indexPath) as! ThreadViewCell

        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.threadName.text = threadNames[indexPath.row]

        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let threadName = threadNames[indexPath.row]
        selectedFeedList = threads[threadName]
        
        
        
        
    }
    
//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return footerView
//    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
    func refreshFooter() {
        if (isPosting) {
            self.tableView.tableFooterView = self.footerView
        } else {
            self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        }
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
