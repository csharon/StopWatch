//
//  ViewController.swift
//  StopWatch
//
//  Created by Chris Sharon on 9/18/15.
//  Copyright © 2015 Appacado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    let numFormatter = NSNumberFormatter()
    var time:Int = 0

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func start(sender: AnyObject) {
        numFormatter.minimumIntegerDigits = 2
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("onTimerTick"), userInfo: nil, repeats: true)
    }
    
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        time = 0
        timerLabel.text = "00:00:00"
    }
    
    func onTimerTick() {
        time++
        let min:Int = getMinutes(time)
        let sec:Int = getSeconds(time - (min * 600))
        let mil:Int = time - (min * 600) - (sec * 10)
        
        timerLabel.text = "\(numFormatter.stringFromNumber(min)!):\(numFormatter.stringFromNumber(sec)!):\(numFormatter.stringFromNumber(mil)!)"
        
        
    }
    
    func getMinutes(mSec:Int)->Int{
        if (mSec > 599) {
            return mSec / 600
        } else {
            return 0
        }
    }
    
    func getSeconds(mSec:Int)->Int{
        if (mSec > 9) {
            return mSec / 10
        } else {
            return 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

