//
//  GameViewController.swift
//  TapTime
//
//  Created by Jessica Cavazos on 12/12/14.
//  Copyright (c) 2014 JessicaCavazos. All rights reserved.
//

import UIKit
import Foundation
import Darwin
import AVFoundation
import iAd

class GameViewController: UIViewController, ADBannerViewDelegate  {
    
    var timerCount = 15
    var timerRunning = false
    var timer = NSTimer()
    var score = 0
    var clickedbtn = 0
    var rdmnumber = 1
    var btn1name = 1
    var btn2name = 2
    var btn3name = 3
    var btn4name = 4
    var btn5name = 5
    var iback = 0

    
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblTryagain: UILabel!
    @IBOutlet var lblnumber: UILabel!
    @IBOutlet var lblscore: UILabel!
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet var btn4: UIButton!
    @IBOutlet var btn5: UIButton!
    @IBOutlet var adBannerView: ADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.canDisplayBannerAds = true
        self.adBannerView.delegate = self
        self.adBannerView.hidden = true //hide until ad loaded
        
        if timerRunning == false
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
        }
    }
    
    //Start iAd
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        NSLog("bannerViewWillLoadAd")
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        NSLog("bannerViewDidLoadAd")
        self.adBannerView.hidden = false //now show banner as ad is loaded
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        NSLog("bannerViewDidLoadAd")
        
        //optional resume paused game code
        
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        NSLog("bannerViewActionShouldBegin")
        
        //optional pause game code
        
        return true
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        NSLog("bannerView")
    }
    
    //End iAd
    
    
    func Counting (){
        timerCount -= 1
        lblTime.text = "\(timerCount)"
        if (timerCount==0){
            timerRunning == false
            self.performSegueWithIdentifier("Score", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "Score") {
            let destViewController = segue.destinationViewController as ScoreViewController;
            destViewController.score = score
        }
    }
    @IBAction func btnTap1(sender: AnyObject) {
        clickedbtn = btn1name
        if clickedbtn == rdmnumber{
            lblTryagain.text = " "
            score += 50
            lblscore.text = "\(score)"
            rdmnumber = Int(arc4random_uniform(4))+1
            lblnumber.text = "\(rdmnumber)"
            
        }
        else {
            lblTryagain.text = "Try Again"
            score -= 10
            lblscore.text = "\(score)"
        }
    }
    
    @IBAction func btnTap2(sender: AnyObject) {
        clickedbtn = btn2name
        if clickedbtn == rdmnumber{
            lblTryagain.text = " "
            score += 50
            lblscore.text = "\(score)"
            rdmnumber = Int(arc4random_uniform(4))+1
            lblnumber.text = "\(rdmnumber)"
            
        }
        else {
            lblTryagain.text = "Try Again"
            score -= 10
            lblscore.text = "\(score)"
        }
    }
    @IBAction func btnTap3(sender: AnyObject) {
        clickedbtn = btn3name
        if clickedbtn == rdmnumber{
            lblTryagain.text = " "
            score += 50
            lblscore.text = "\(score)"
            rdmnumber = Int(arc4random_uniform(5))+1
            lblnumber.text = "\(rdmnumber)"
            
        }
        else {
            lblTryagain.text = "Try Again"
            score -= 10
            lblscore.text = "\(score)"
        }
    }
    
    @IBAction func btnTap4(sender: AnyObject) {
        clickedbtn = btn4name
        if clickedbtn == rdmnumber{
            lblTryagain.text = " "
            score += 50
            lblscore.text = "\(score)"
            rdmnumber = Int(arc4random_uniform(5))+1
            lblnumber.text = "\(rdmnumber)"
            
        }
        else {
            lblTryagain.text = "Try Again"
            score -= 10
            lblscore.text = "\(score)"
        }
    }
    @IBAction func btnTap5(sender: AnyObject) {
        clickedbtn = btn5name
        if clickedbtn == rdmnumber{
            lblTryagain.text = " "
            score += 50
            lblscore.text = "\(score)"
            rdmnumber = Int(arc4random_uniform(5))+1
            lblnumber.text = "\(rdmnumber)"
        }
        else {
            lblTryagain.text = "Try Again"
            score -= 10
            lblscore.text = "\(score)"
        }
    }

    
}