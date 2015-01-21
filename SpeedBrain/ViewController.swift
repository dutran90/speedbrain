//
//  ViewController.swift
//  SpeedBrain
//
//  Created by Yosemite on 1/16/15.
//  Copyright (c) 2015 Yosemite. All rights reserved.
//

import UIKit
import Darwin
import Social



class ViewController: UIViewController {

    @IBOutlet weak var imgResult: UIImageView!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var progressTime: UIProgressView!
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
    
    var points:Int = 0
    var check = true
    var failed = false
    var speed = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if score != nil{
            changeNumber()
        }
        
        if lblResult != nil{
            self.finalResult()
        }
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressQuit(sender: AnyObject) {
        
        exit(0)
        
    }
    
    @IBAction func share(sender: AnyObject) {
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            
            var facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            
            
            facebookSheet.setInitialText("I'm playing SpeedBrain game! :)")
            
            self.presentViewController(facebookSheet, animated: true, completion: nil)
            
            
        } else {
            
            var alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
            
        }

        
    }
    
    func pressTrue() {
        
        checkResult()
        if check == true{
            // run progress view
            progressTime.setProgress(1, animated: true)
            run()
            changeNumber()
            points += 100
            switch points{
            case 500...1000:
                speed = 900
            case 1000...1500:
                speed = 800
            case 1500...2000:
                speed = 700
            case 2000...2500:
                speed = 500
            case 2500...3000:
                speed = 400
            case 3000...3500:
                speed = 300
            case 3500...4000:
                speed = 200
            case 4000...4500:
                speed = 100
            case 4500...10000:
                speed = 50
            default: speed = 1000
            }
            score.text = String(points)
            failed = false
        }else{
            failed = true
        }
        
    }
  

    func pressFalse(){
        
        checkResult()
        if check == false{
            // run progress view
            progressTime.setProgress(1, animated: true)
            run()
            changeNumber()
            points += 100
            switch points{
            case 500...1000:
                speed = 900
            case 1000...1500:
                speed = 800
            case 1500...2000:
                speed = 700
            case 2000...2500:
                speed = 500
            case 2500...3000:
                speed = 400
            case 3000...3500:
                speed = 300
            case 3500...4000:
                speed = 200
            case 4000...4500:
                speed = 100
            case 4500...10000:
                speed = 50
            default: speed = 1000
            }
            score.text = String(points)
            failed = false
        }else{
            failed = true
        }
        
    }
    
    func changeNumber(){
        
        // Default value

        number1 = Int(arc4random_uniform(9))+1

        number2 = Int(arc4random_uniform(9))+1

        symbol = Int(arc4random_uniform(2))
        
        if symbol == 0{
            self.operatorSymbol.text = "+"
            number3 = Int(arc4random_uniform(2))-1 + number1 + number2
        }else{
            self.operatorSymbol.text = "-"
            number3 = Int(arc4random_uniform(2))-1 + number1 - number2
        }
        
        // Set value to label
        self.lblnumber1.text = String(number1)
        self.lblnumber2.text = String(number2)
        self.lblnumber3.text = String(number3)
        
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
        if identifier == "segueFailedBtnTrue"{
            pressTrue()
            if failed{
                self.finalResult()
                return true
            }else{
                return false
            }
            
        }
        if identifier == "segueFailedBtnFalse"{
            pressFalse()
            if failed{
                self.finalResult()
                return true
            }else{
                return false
            }
            
        }
        return true
    }
    
    // progress view
    var counter:Int = 1000 {
        didSet {
            let fractionalProgress = Float(counter)/Float(speed)
            let animated = counter != 0
        progressTime.setProgress(fractionalProgress, animated: animated)
        }
    }
    
    func run(){
        self.counter = speed
        for i in 0..<speed {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
                sleep(1)
                dispatch_async(dispatch_get_main_queue(), {
                    if self.counter <= 1{
                        // call segue Failed
                        self.finalResult()
                            self.performSegueWithIdentifier("segueFailedBtnTrue", sender: self)
                    }
                    self.counter--
                    return
                })
            })
        }
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        if (segue.identifier == "segueFailedBtnTrue" || segue.identifier == "segueFailedBtnFalse") {
//            finalResult()
//        }
//    }
    
    func finalResult(){
        if lblResult != nil{
            if points <= 1000{
                lblResult.text = "Good!"
            }
            if points > 1000 && points <= 3000 {
                lblResult.text = "Perfect!"
            }
            if points > 3000{
                lblResult.text = "Excellent!"
            }
            
            let i = Int(arc4random_uniform(3))
            if i == 0{
                imgResult.image = UIImage(named: "finalResult1")
            }
            if i == 1{
                imgResult.image = UIImage(named: "finalResult2")
            }
            if i == 2{
                imgResult.image = UIImage(named: "finalResult3")
            }
        }
    }
}

