//
//  ViewController.swift
//  day1-swift-demo
//
//  Created by Dave Henson on 6/24/15.
//  Copyright (c) 2015 Dave Henson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myView:UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView = UIView(frame: CGRectMake(10.0, 10.0, 100.0, 100.0))
        self.view.addSubview(myView)
        myView.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        
        
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        for touch : AnyObject in touches
        {
            let location = touch.locationInView(self.view)
            myView.center = location
        }
    }


}

