//
//  EmotionViewController.swift
//  learning-swift
//
//  Created by Brendan McManus on 12/27/14.
//  Copyright (c) 2014 Brendan McManus. All rights reserved.
//

import UIKit
import ParseUI


class EmotionViewController: UIViewController {
    
    @IBOutlet weak var AngryButton: UIButton!
    @IBOutlet weak var MehButton: UIButton!
    @IBOutlet weak var WorriedButton: UIButton!
    @IBOutlet weak var StressedButton: UIButton!
    @IBOutlet weak var SadButton: UIButton!
    @IBOutlet weak var HappyButton: UIButton!
    var background :UIImage = UIImage.alloc()
    
    var happy = false
    var sad = false
    var worried = false
    var stressed = false
    var meh = false
    var angry = false
    
    
    var emotionDictionary = [String:Bool]()
    
    @IBOutlet weak var HappyLabel: UILabel!
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
    }
    
    
    @IBAction func HappyPressed(sender: UIButton) {
        sender.selected = !sender.selected
        if (AngryButton.selected) {
            AngryButton.selected = false
        }
        if (SadButton.selected) {
            SadButton.selected = false
        }
        if (StressedButton.selected) {
            StressedButton.selected = false
        }
        if (WorriedButton.selected) {
            WorriedButton.selected = false
        }
        if (MehButton.selected) {
            MehButton.selected = false
        }
        happy = !happy
    }
    
    @IBAction func SadPressed(sender: UIButton) {
        sender.selected = !sender.selected
        if (AngryButton.selected) {
            AngryButton.selected = false
        }
        if (HappyButton.selected) {
            HappyButton.selected = false
        }
        if (StressedButton.selected) {
            StressedButton.selected = false
        }
        if (WorriedButton.selected) {
            WorriedButton.selected = false
        }
        if (MehButton.selected) {
            MehButton.selected = false
        }

        sad = !sad
    }
    
    @IBAction func StressedPressed(sender: UIButton) {
        sender.selected = !sender.selected
        if (AngryButton.selected) {
            AngryButton.selected = false
        }
        if (SadButton.selected) {
            SadButton.selected = false
        }
        if (HappyButton.selected) {
            HappyButton.selected = false
        }
        if (WorriedButton.selected) {
            WorriedButton.selected = false
        }
        if (MehButton.selected) {
            MehButton.selected = false
        }

        stressed = !stressed
    }
    
    @IBAction func WorriedPressed(sender: UIButton) {
        sender.selected = !sender.selected
        if (AngryButton.selected) {
            AngryButton.selected = false
        }
        if (SadButton.selected) {
            SadButton.selected = false
        }
        if (StressedButton.selected) {
            StressedButton.selected = false
        }
        if (HappyButton.selected) {
            HappyButton.selected = false
        }
        if (MehButton.selected) {
            MehButton.selected = false
        }

        worried = !worried
    }
    
    @IBAction func MehPressed(sender: UIButton) {
        sender.selected = !sender.selected
        if (AngryButton.selected) {
            AngryButton.selected = false
        }
        if (SadButton.selected) {
            SadButton.selected = false
        }
        if (StressedButton.selected) {
            StressedButton.selected = false
        }
        if (WorriedButton.selected) {
            WorriedButton.selected = false
        }
        if (HappyButton.selected) {
            HappyButton.selected = false
        }

        meh = !meh
    }
    
    @IBAction func AngryPressed(sender: UIButton) {
        sender.selected = !sender.selected
        if (HappyButton.selected) {
            HappyButton.selected = false
        }
        if (SadButton.selected) {
            SadButton.selected = false
        }
        if (StressedButton.selected) {
            StressedButton.selected = false
        }
        if (WorriedButton.selected) {
            WorriedButton.selected = false
        }
        if (MehButton.selected) {
            MehButton.selected = false
        }

        angry = !angry
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "finishedSelecting" {
            
            emotionDictionary.updateValue(happy, forKey: "happy")
            emotionDictionary.updateValue(sad, forKey: "sad")
            emotionDictionary.updateValue(angry, forKey: "angry")
            emotionDictionary.updateValue(stressed, forKey: "stressed")
            emotionDictionary.updateValue(worried, forKey: "worried")
            emotionDictionary.updateValue(meh, forKey: "meh")
            
            let rvc = segue.destinationViewController as ReasonViewController
            
            rvc.emotionsSelected = emotionDictionary
        }
    }
     
}
