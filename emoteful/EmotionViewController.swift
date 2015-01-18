//
//  EmotionViewController.swift
//  learning-swift
//
//  Created by Brendan McManus on 1/16/15.
//  Copyright (c) 2015 Brendan McManus. All rights reserved.
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
    var current = String()
    
    
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
            angry = false
        }
        if (SadButton.selected) {
            SadButton.selected = false
            sad = false
        }
        if (StressedButton.selected) {
            StressedButton.selected = false
            stressed = false
        }
        if (WorriedButton.selected) {
            WorriedButton.selected = false
            worried = false
        }
        if (MehButton.selected) {
            MehButton.selected = false
            meh = false
        }
        happy = !happy
        if (happy == true) {
            current = "happy"
        }
    }
    
    @IBAction func SadPressed(sender: UIButton) {
        sender.selected = !sender.selected
        if (AngryButton.selected) {
            AngryButton.selected = false
            angry = false
        }
        if (HappyButton.selected) {
            HappyButton.selected = false
            happy = false
        }
        if (StressedButton.selected) {
            StressedButton.selected = false
            stressed = false
        }
        if (WorriedButton.selected) {
            WorriedButton.selected = false
            worried = false
        }
        if (MehButton.selected) {
            MehButton.selected = false
            meh = false
        }

        sad = !sad
        if (sad == true) {
            current = "sad"
        }
    }
    
    @IBAction func StressedPressed(sender: UIButton) {
        sender.selected = !sender.selected
        if (AngryButton.selected) {
            AngryButton.selected = false
            angry = false
        }
        if (SadButton.selected) {
            SadButton.selected = false
            sad = false
        }
        if (HappyButton.selected) {
            HappyButton.selected = false
            happy = false
        }
        if (WorriedButton.selected) {
            WorriedButton.selected = false
            worried = false
        }
        if (MehButton.selected) {
            MehButton.selected = false
            meh = false
        }

        stressed = !stressed
        if (stressed == true) {
            current = "stressed"
        }
    }
    
    @IBAction func WorriedPressed(sender: UIButton) {
        sender.selected = !sender.selected
        if (AngryButton.selected) {
            AngryButton.selected = false
            angry = false
        }
        if (SadButton.selected) {
            SadButton.selected = false
            sad = false
        }
        if (StressedButton.selected) {
            StressedButton.selected = false
            stressed = false
        }
        if (HappyButton.selected) {
            HappyButton.selected = false
            happy = false
        }
        if (MehButton.selected) {
            MehButton.selected = false
            meh = false
        }

        worried = !worried
        if (worried == true) {
            current = "worried"
        }
    }
    
    @IBAction func MehPressed(sender: UIButton) {
        sender.selected = !sender.selected
        if (AngryButton.selected) {
            AngryButton.selected = false
            angry = false
        }
        if (SadButton.selected) {
            SadButton.selected = false
            sad = false
        }
        if (StressedButton.selected) {
            StressedButton.selected = false
            stressed = false
        }
        if (WorriedButton.selected) {
            WorriedButton.selected = false
            worried = false
        }
        if (HappyButton.selected) {
            HappyButton.selected = false
            happy = false
        }

        meh = !meh
        if (meh == true) {
            current = "meh"
        }
    }
    
    @IBAction func AngryPressed(sender: UIButton) {
        sender.selected = !sender.selected
        if (HappyButton.selected) {
            HappyButton.selected = false
            happy = false
        }
        if (SadButton.selected) {
            SadButton.selected = false
            sad = false
        }
        if (StressedButton.selected) {
            StressedButton.selected = false
            stressed = false
        }
        if (WorriedButton.selected) {
            WorriedButton.selected = false
            worried = false
        }
        if (MehButton.selected) {
            MehButton.selected = false
            meh = false
        }

        angry = !angry
        if (angry == true) {
            current = "angry"
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "finishedSelecting" {
            
            let rvc = segue.destinationViewController as ReasonViewController
            
            UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
            view.layer.renderInContext(UIGraphicsGetCurrentContext())
            var img: UIImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            rvc.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            
            rvc.background = img
            rvc.emotion = current
            
            UIGraphicsEndImageContext();
        }
    }
     
}
