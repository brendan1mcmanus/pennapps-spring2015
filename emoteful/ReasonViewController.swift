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
    
    @IBOutlet weak var angryLabel: UILabel!
    @IBOutlet weak var mehLabel: UILabel!
    @IBOutlet weak var worriedLabel: UILabel!
    @IBOutlet weak var stressedLabel: UILabel!
    @IBOutlet weak var sadLabel: UILabel!
    @IBOutlet weak var happyLabel: UILabel!
    var emotionsSelected = [String:Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for s in emotionsSelected {
            if s.0 == "angry" {
                angryLabel.text = s.1.description
            } else if s.0 == "sad" {
                sadLabel.text = s.1.description
            } else if s.0 == "happy" {
                happyLabel.text = s.1.description
            } else if s.0 == "worried" {
                worriedLabel.text = s.1.description
            } else if s.0 == "stressed" {
                stressedLabel.text = s.1.description
            } else if s.0 == "meh" {
                mehLabel.text = s.1.description
            }
        }
        
        putInParseDatabase()
        
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