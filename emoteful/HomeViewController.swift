//
//  HomeViewController.swift
//  learning-swift
//
//  Created by Brendan McManus on 1/16/15.
//  Copyright (c) 2015 Brendan McManus. All rights reserved.
//

import UIKit
import ParseUI


class HomeViewController : UIViewController {
    
    @IBOutlet weak var recommendationLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    var happy:Double = Double()
    var sad: Double = Double()
    var worried:Double = Double()
    var stressed:Double = Double()
    var angry:Double = Double()
    var meh:Double = Double()
    var count:Double = Double()
    var activity:Double = Double()
    var sleep:Double = Double()
    var final:Double = Double()
    
    
    @IBOutlet weak var WelcomeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var query = PFQuery(className:"database")
        query.getObjectInBackgroundWithId("V65tMqnwrD") {
            (database: PFObject!, error: NSError!) -> Void in
            self.happy = database["happyCount"] as Double
            self.sad = database["sadCount"] as Double
            self.worried = database["worriedCount"] as Double
            self.stressed = database["stressedCount"] as Double
            self.angry = database["angryCount"] as Double
            self.meh = database["mehCount"] as Double
            self.count =  self.happy + self.sad + self.worried + self.self.stressed + self.angry + self.meh
            self.happy = self.happy / self.count
            self.happy *= 100
            if (self.happy > 70) {
                self.happy = 70
            }
            var newHappy:Double = self.happy + 0.0
            self.happy = self.happy / 70 * 0.7
            
            
            self.sleep = database["sleep"] as Double
            self.sleep *= 100
            self.sleep = self.sleep * 0.2 / 25200
            
            self.activity = database["steps"] as Double
            self.activity *= 100
            self.activity = self.activity / 15000 * 0.1
           
            self.final = self.activity + self.sleep + newHappy as Double
            self.scoreLabel.text = String(format:"%.0f", self.final)
            
        }
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background.png")!)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        var u: UPUser
        var url: UPURLResponse
        UPUserAPI.getCurrentUserWithCompletion {(u, url, error:NSError!) -> Void in
            var message:String = u.firstName + " " + u.lastName
            
            self.WelcomeLabel.text = "Hello, " + message + "!"
        }
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .ScaleAspectFit
        let image = UIImage(named: "emoteful-header-logo.png")
        imageView.image = image
        navigationItem.titleView = imageView
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        updateDatabase()
        updateSuggestionLabel()
        
    }
    
    private func updateSuggestionLabel() {
        if (self.final < 50) {
            self.recommendationLabel.text = "I recommend meditation."
            self.suggestionLabel.text = "You seem to be stresed lately"
        }
        
        if (self.final < 70 && self.final > 50) {
            self.recommendationLabel.text = "Try to get out and exercise!"
            self.suggestionLabel.text = "You seem to be fairly meh lately"
        }
        
        if (self.final > 70 && self.final < 80) {
            self.recommendationLabel.text = "Hooray!"
            self.suggestionLabel.text = "You seem to be very happy"
        }
        
        if (self.final > 80) {
            self.recommendationLabel.text = "WOW!"
            self.suggestionLabel.text = "You are doing stellar"
        }
    }
    
    private func updateDatabase() {
        var query = PFQuery(className:"database")
        query.getObjectInBackgroundWithId("V65tMqnwrD") {
            (database: PFObject!, error: NSError!) -> Void in
            if error != nil {
                NSLog("%@", error)
            } else {
                UPSleepAPI.getSleepsWithLimit(1, completion: { (results:[AnyObject]!, response:UPURLResponse!, error:NSError!) -> Void in
                    var sleepy:UPSleep = results[0] as UPSleep
                    var num:NSNumber = sleepy.totalTime
                    var n:Int = Int(num)
                    database["sleep"] = n
                    database.save()
                })
                UPMoveAPI.getMovesWithLimit(1, completion: { (results:[AnyObject]!, response:UPURLResponse!, error:NSError!) -> Void in
                    if (results.count > 0) {
                        var acty:UPMove = results[0] as UPMove
                        var stepy:NSNumber = acty.steps
                        var n:Int = Int(stepy)
                        database["steps"] = n
                        database.save()
                    }
                })
            }
        }
        updateSuggestionLabel()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "emotions") {
            
            let vc = segue.destinationViewController as EmotionViewController
            
            UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
            view.layer.renderInContext(UIGraphicsGetCurrentContext())
            var img: UIImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            vc.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            
            vc.background = img
            
            UIGraphicsEndImageContext();
            
        }
    }

}