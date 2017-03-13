//
//  ImageFeedTuple.swift
//  snapChatProject
//
//  Created by David Fang on 3/11/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class ImageFeedTuple {
    
    var poster: String
    var posttime: NSDate
    var image: UIImage
    var hasBeenRead: Bool
    
    init(poster: String, posttime: NSDate, image: UIImage) {
        self.poster = poster
        self.posttime = posttime
        self.image = image
        self.hasBeenRead = false
    }
    
    func setAsRead() {
        self.hasBeenRead = true
    }
    
}
