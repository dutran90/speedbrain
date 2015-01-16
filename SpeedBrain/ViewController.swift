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

    @IBOutlet weak var btnFalse: UIButton!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var operatorSymbol: UILabel!
    @IBOutlet weak var lblnumber3: UILabel!
    @IBOutlet weak var lblnumber2: UILabel!
    @IBOutlet weak var lblnumber1: UILabel!
    @IBOutlet weak var score: UILabel!
    
    var number1:Int = Int(arc4random_uniform(10))
    var number2 = Int(arc4random_uniform(10))
    var number3 = Int(arc4random_uniform(10))
    var symbol = Int(arc4random_uniform(2))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if score != nil{
            changeNumber()
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressQuit(sender: AnyObject) {
        
        exit(0)
        
    }
    
    
    @IBAction func pressTrue(sender: AnyObject) {
        
        changeNumber()
        
    }
  

    @IBAction func pressFalse(sender: AnyObject) {
        
        
        
    }
    
    func changeNumber(){
        
        // Default value

        number1 = Int(arc4random_uniform(9))+1

        number2 = Int(arc4random_uniform(9))+1

        number3 = Int(arc4random_uniform(9))+1

        symbol = Int(arc4random_uniform(2))
        
        // Set value to label
        self.lblnumber1.text = String(number1)
        self.lblnumber2.text = String(number2)
        self.lblnumber3.text = String(number3)
        if symbol == 0{
            self.operatorSymbol.text = "+"
        }else{
            self.operatorSymbol.text = "-"
        }
        
    }
    
}

