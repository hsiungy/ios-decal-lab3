//
//  ViewController.swift
//  stopwatch
//
//  Created by YHsiung on 2/16/17.
//  Copyright © 2017 YHsiung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let sw = Stopwatch()
    
    
    @IBOutlet var displayTimeLabel: UILabel!
    func updateTime() {
        let currentTime = Date.timeIntervalSinceReferenceDate
        // Find difference between current time and start time.
        var elapsedTime: TimeInterval = currentTime - sw.startTime
        // Convert to minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (TimeInterval(minutes) * 60)
        // Convert to seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= TimeInterval(seconds)
        // Convert to fraction of milliseconds for display.
        let fraction = UInt8(elapsedTime * 100)
        displayTimeLabel.text = String(format: "%02d:%02d.%02d", minutes, seconds, fraction)
        
    }
    
    
    @IBAction func start(_ sender: AnyObject) {
        let sel : Selector = #selector(ViewController.updateTime)
        sw.timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self, selector: sel,
                                     userInfo: nil,
                                     repeats: true)
        sw.startTime = Date.timeIntervalSinceReferenceDate
    }

    @IBAction func stop(_ sender: AnyObject) {
        // go back to date object and reset it
        sw.timer.invalidate()
    }
}

