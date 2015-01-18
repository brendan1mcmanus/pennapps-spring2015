//
//  ReasonViewController.swift
//  learning-swift
//
//  Created by Brendan McManus on 12/27/14.
//  Copyright (c) 2014 Brendan McManus. All rights reserved.
//

import ParseUI
import UIKit


class ReasonViewController : UIViewController {
    var background :UIImage = UIImage.alloc()
    @IBOutlet weak var questionEmote: UILabel!
    var emotionsSelected = [String:Bool]()
    
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
        
        
        for s in emotionsSelected {
            if s.1 == true {
                questionEmote.text = "What might be making you feel " + s.0 + "?"
            }
        }
        
        putInParseDatabase()
        
    }
    
    @IBAction func exercisePressed(sender: UIButton) {
        sender.selected = !sender.selected
    }
    
    @IBAction func workPressed(sender: UIButton) {
        sender.selected = !sender.selected
    }
    
    @IBAction func weatherPressed(sender: UIButton) {
        sender.selected = !sender.selected
    }
    
    @IBAction func friendsPressed(sender: UIButton) {
        sender.selected = !sender.selected
    }
    
    @IBAction func homeworkPressed(sender: UIButton) {
        sender.selected = !sender.selected
    }
    
    @IBAction func relationshipsPressed(sender: UIButton) {
        sender.selected = !sender.selected
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    private func putInParseDatabase() {
        var emotionsObject = PFObject(className: "Emotions")
        emotionsObject["myDictionary"] = emotionsSelected
        emotionsObject.saveInBackground()
    }
    
    
}