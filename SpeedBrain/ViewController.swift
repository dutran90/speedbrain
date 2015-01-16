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
    
    var points = 0
    var check = true
    var failed = false
    
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
        
        checkResult()
        if check == true{
            changeNumber()
            points += 100
        }else{
            failed = true
        }
        
    }
  

    @IBAction func pressFalse(sender: AnyObject) {
        
        checkResult()
        if check == false{
            changeNumber()
            points += 100
        }else{
            failed == true
        }
        
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
        score.text = String(points)
        
    }
    
    func checkResult() -> Bool{
        
        if symbol == 0{
            if number1 + number2 == number3{
                check = true
            }else{
                check = false
            }
        }else{
            if number1 - number2 == number3{
                check = true
            }else{
                check = false
            }
        }
        return check
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if identifier == "segueFailed"{
            
            if failed{
                return true
            }else{
                return false
            }
            
        }
        return true
    }
    
}

