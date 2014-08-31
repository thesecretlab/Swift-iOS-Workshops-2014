//
//  ViewController.swift
//  Photos
//
//  Created by Timothy Rodney Nugent on 26/08/2014.
//  Copyright (c) 2014 Timothy Rodney Nugent. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
                            
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MARK: IBAction funcs -
    @IBAction func takePhoto(sender: AnyObject) {
        var picker = UIImagePickerController()
        
        let sourceType = UIImagePickerControllerSourceType.Camera
        if (UIImagePickerController.isSourceTypeAvailable(sourceType))
        {
            // we can use the camera
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            
            let frontCamera = UIImagePickerControllerCameraDevice.Front
            let rearCamera = UIImagePickerControllerCameraDevice.Rear
            //use the front facing camera if available
            if (UIImagePickerController.isCameraDeviceAvailable(frontCamera))
            {
                picker.cameraDevice = frontCamera
            }
            else
            {
                picker.cameraDevice = rearCamera
            }
            // make this object be the delegate for the picker
            picker.delegate = self
            
            self.presentViewController(picker, animated: true, completion: nil)
        }
        
    }

    @IBAction func loadFromLibrary(sender: AnyObject) {
        var picker = UIImagePickerController()
        picker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func sharePhoto(sender: AnyObject) {
        let image = self.imageView.image?
        if (image != nil)
        {
            let activity = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
            self.presentViewController(activity, animated: true) { () -> Void in
                // we don't need to do anything
            }
        }
    }
    

// MARK: imagePicker delegates -
    func imagePickerController(picker: UIImagePickerController!,
                didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!)
    {
        let image: UIImage = info[UIImagePickerControllerOriginalImage] as UIImage
        self.imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}

