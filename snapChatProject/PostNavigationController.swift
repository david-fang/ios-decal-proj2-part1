//
//  PostNavigationController.swift
//  snapChatProject
//
//  Created by Akilesh Bapu on 2/28/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class PostNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationBar.barTintColor = UIColor.darkGray
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.backItem?.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
}
