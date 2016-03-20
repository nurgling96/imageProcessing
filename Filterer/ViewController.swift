//
//  ViewController.swift
//  Filterer
//
//  Created by Jack on 2015-09-22.
//  Copyright © 2015 UofT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var RedButton: UIButton!
    
    @IBAction func PureButton(sender: UIButton) {
        let img = imageView.image
        if sender.selected {
            imageView.image = img
            sender.selected = false
        } else {
            imageView.image = filter.pure(imageView.image!)
            sender.selected = true
        }
    }

    
    @IBAction func RedFilterButton(sender: UIButton) {
        let img = imageView.image
        if sender.selected {
            imageView.image = img
            sender.selected = false
        } else {
            imageView.image = filter.red(imageView.image!)
            sender.selected = true
        }
    }
    
    @IBAction func GreenFilterButton(sender: UIButton) {
        let img = imageView.image
        if sender.selected {
            imageView.image = img
            sender.selected = false
        } else {
            imageView.image = filter.green(imageView.image!)
            sender.selected = true
        }
    }
    
    @IBAction func BlueFilterButton(sender: UIButton) {
        let img = imageView.image
        if sender.selected {
            imageView.image = img
            sender.selected = false
        } else {
            imageView.image = filter.blue(imageView.image!)
            sender.selected = true
        }
    }
    
    
    @IBAction func YellowFilterButton(sender: UIButton) {
        let img = imageView.image
        if sender.selected {
            imageView.image = img
            sender.selected = false
        } else {
            imageView.image = filter.sepia(imageView.image!)
            sender.selected = true
        }
    }
    
    @IBAction func PurpleFilterButton(sender: UIButton) {
        let img = imageView.image
        if sender.selected {
            imageView.image = img
            sender.selected = false
        } else {
            imageView.image = filter.greyness(imageView.image!)
            sender.selected = true
        }
    }
    
    
    
    

    
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet var bottomMenu: UIView!
    
    @IBOutlet var filterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondaryMenu.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.8)
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
    }

    // MARK: Share
    @IBAction func onShare(sender: AnyObject) {
        let activityController = UIActivityViewController(activityItems: ["Check out our really cool app", imageView.image!], applicationActivities: nil)
        presentViewController(activityController, animated: true, completion: nil)
    }
    
    // MARK: New Photo
    @IBAction func onNewPhoto(sender: AnyObject) {
        let actionSheet = UIAlertController(title: "New Photo", message: nil, preferredStyle: .ActionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { action in
            self.showCamera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Album", style: .Default, handler: { action in
            self.showAlbum()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func showCamera() {
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .Camera
        
        presentViewController(cameraPicker, animated: true, completion: nil)
    }
    
    func showAlbum() {
        let cameraPicker = UIImagePickerController()
        cameraPicker.delegate = self
        cameraPicker.sourceType = .PhotoLibrary
        
        presentViewController(cameraPicker, animated: true, completion: nil)
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        dismissViewControllerAnimated(true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Filter Menu
    @IBAction func onFilter(sender: UIButton) {
        if (sender.selected) {
            hideSecondaryMenu()
            
            sender.selected = false
        } else {
            showSecondaryMenu()
            sender.selected = true
        }
    }
    
    func showSecondaryMenu() {
        view.addSubview(secondaryMenu)
        
        let bottomConstraint = secondaryMenu.bottomAnchor.constraintEqualToAnchor(bottomMenu.topAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        
        let heightConstraint = secondaryMenu.heightAnchor.constraintEqualToConstant(44)
        
        NSLayoutConstraint.activateConstraints([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        
        view.layoutIfNeeded()
        
        self.secondaryMenu.alpha = 0
        UIView.animateWithDuration(0.4) {
            self.secondaryMenu.alpha = 1.0
        }
    }

    func hideSecondaryMenu() {
        UIView.animateWithDuration(0.4, animations: {
            self.secondaryMenu.alpha = 0
            }) { completed in
                if completed == true {
                    self.secondaryMenu.removeFromSuperview()
                }
        }
    }

}

