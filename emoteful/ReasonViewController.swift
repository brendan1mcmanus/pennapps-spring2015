//
//  ReasonViewController.swift
//  learning-swift
//
//  Created by Brendan McManus on 1/16/15.
//  Copyright (c) 2015 Brendan McManus. All rights reserved.
//

import ParseUI
import UIKit


class ReasonViewController : UIViewController {
    var background :UIImage = UIImage.alloc()
    @IBOutlet weak var questionEmote: UILabel!
    var emotion = String()
    var work:Bool = false
    var relationship:Bool = false
    var weather:Bool = false
    var exercise:Bool = false
    var friends:Bool = false
    var homework:Bool = false
    
    var reason = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor(patternImage: background)
        
        
        // Blur Effect
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        view.addSubview(blurEffectView)
        
        // Vibrancy Effect
        var vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
        var vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyEffectView.frame = view.bounds
        
        
        
        // Add the vibrancy view to the blur view
        blurEffectView.contentView.addSubview(vibrancyEffectView)
        
        self.view.sendSubviewToBack(blurEffectView)
        
        questionEmote.text = "What might be making you feel " + emotion + "?"
        
    }
    @IBAction func finishedReasons(sender: UIButton) {
        putInParseDatabase()
    }
    
    @IBAction func exercisePressed(sender: UIButton) {
        sender.selected = !sender.selected
        exercise = !exercise
    }
    
    @IBAction func workPressed(sender: UIButton) {
        sender.selected = !sender.selected
        work = !work
    }
    
    @IBAction func weatherPressed(sender: UIButton) {
        sender.selected = !sender.selected
        weather = !weather
    }
    
    @IBAction func friendsPressed(sender: UIButton) {
        sender.selected = !sender.selected
        friends = !friends
    }
    
    @IBAction func homeworkPressed(sender: UIButton) {
        sender.selected = !sender.selected
        homework = !homework
    }
    
    @IBAction func relationshipsPressed(sender: UIButton) {
        sender.selected = !sender.selected
        relationship = !relationship
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    private func putInParseDatabase() {
        var query = PFQuery(className:"database")
        query.getObjectInBackgroundWithId("V65tMqnwrD") {
            (database: PFObject!, error: NSError!) -> Void in
            if error != nil {
                NSLog("%@", error)
            } else {
                if (self.emotion == "happy") {
                    var i:Int = database["happyCount"] as Int
                    database["happyCount"] = i + 1
                } else if (self.emotion == "sad") {
                    var i:Int = database["sadCount"] as Int
                    database["sadCount"] = i + 1
                } else if (self.emotion == "worried") {
                    var i:Int = database["worriedCount"] as Int
                    database["worriedCount"] = i + 1
                } else if (self.emotion == "stressed") {
                    var i:Int = database["stressedCount"] as Int
                    database["stressedCount"] = i + 1
                } else if (self.emotion == "angry") {
                    var i:Int = database["angryCount"] as Int
                    database["angryCount"] = i + 1
                } else if (self.emotion == "meh") {
                    var i:Int = database["mehCount"] as Int
                    database["mehCount"] = i + 1
                }
                database.saveInBackground()
            }
        }
    }
}