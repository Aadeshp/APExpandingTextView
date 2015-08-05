//
//  ViewController.swift
//  APExpandingTextView
//
//  Created by aadesh on 08/03/2015.
//  Copyright (c) 2015 aadesh. All rights reserved.
//

import UIKit
import APExpandingTextView

class ViewController: UIViewController, APExpandingTextViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var textView: APExpandingTextView = APExpandingTextView(frame: CGRectMake(self.view.frame.size.width / 2 - 100, 50, 200, 33))
        textView.layer.borderColor = UIColor.blackColor().CGColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 5.0
        textView._delegate = self
        self.view.addSubview(textView)
    }
    
    func textViewWillExpand(textView: APExpandingTextView!) {
        NSLog("WILL EXPAND")
    }
    func textViewDidExpand(textView: APExpandingTextView!) {
        NSLog("DID EXPAND")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

