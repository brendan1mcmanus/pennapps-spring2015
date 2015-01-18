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
        var emotionsObject = PFObject(className: "database")
        reason.append(homework)
        reason.append(work)
        reason.append(relationship)
        reason.append(friends)
        reason.append(weather)
        reason.append(exercise)
        emotionsObject["curremotion"] = emotion
        emotionsObject["reasons"] = reason
        emotionsObject.saveInBackground()
    }
    
    
}