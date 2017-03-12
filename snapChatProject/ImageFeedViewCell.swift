//
//  ImageFeedViewCell.swift
//  snapChatProject
//
//  Created by David Fang on 3/11/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImageFeedViewCell: UITableViewCell {

    @IBOutlet weak var hasReadImage: UIImageView!
    @IBOutlet weak var posterName: UILabel!
    @IBOutlet weak var timeAgo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
