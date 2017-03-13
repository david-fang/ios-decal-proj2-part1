//
//  ImagePickerController.swift
//  snapChatProject
//
//  Created by Akilesh Bapu on 2/27/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ImagePickerController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var successLabel: UILabel!
    @IBOutlet var imageCollectionView: UICollectionView!

    var selectedImage: UIImage?
    var postSuccessful: Bool? {
        didSet {
            if (postSuccessful)! {
                successLabel.isHidden = false
                let _ = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(self.hideSuccessIndicator), userInfo: nil, repeats: false);
            } else {
                hideSuccessIndicator()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageCollectionView.collectionViewLayout = ImageFlowLayout.init()
        self.imageCollectionView.backgroundColor = UIColor.lightGray
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.successLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func hideSuccessIndicator() {
        successLabel.isHidden = true
    }

    func selectImage(_ image: UIImage) {
        //The image being selected is passed in as "image".
        self.selectedImage = image
        performSegue(withIdentifier: "ShowPostFeeds", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowPostFeeds") {
            if let dest = segue.destination as? PostFeedsViewController {
                dest.imageToPost = self.selectedImage
            }
        }
    }
    
    @IBAction func unwindToImagePicker(segue: UIStoryboardSegue) {
        if let source = segue.source as? PostFeedsViewController {
            self.postSuccessful = source.postSuccessful
        }
    }


    /** DON'T MODIFY CODE HERE AND BELOW! **/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pickImageCell", for: indexPath) as! ImageCollectionViewCell
        cell.image.image = allImages[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! ImageCollectionViewCell
        selectImage(selectedCell.image.image!)
    }
}
