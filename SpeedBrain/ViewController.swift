//
//  ViewController.swift
//  SpeedBrain
//
//  Created by Yosemite on 1/16/15.
//  Copyright (c) 2015 Yosemite. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressQuit(sender: AnyObject) {
        
        exit(0)
        
    }
  

}

