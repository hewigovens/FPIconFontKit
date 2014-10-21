//
//  ViewController.swift
//  Demo
//
//  Created by hewig on 10/21/14.
//  Copyright (c) 2014 hewig. All rights reserved.
//

import Cocoa
import FPIconFontKit

class ViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fontPath = NSBundle.mainBundle().pathForResource("octicons", ofType: "ttf")
        let font = FPIconFont(path:fontPath!)
        
        let image = font.getImage("heart", size: 256, color: NSColor.purpleColor())
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.imageView.image = image
        })
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

