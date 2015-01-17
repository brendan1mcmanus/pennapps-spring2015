//
//  CustomTabBar.swift
//  learning-swift
//
//  Created by Brendan McManus on 12/27/14.
//  Copyright (c) 2014 Brendan McManus. All rights reserved.
//

import Foundation
import ParseUI
import UIKit


class CustomTabBar : UIViewController {
    
    @IBOutlet weak var placeholderView: UIView!
    @IBOutlet var tabBarButtons: [UIButton]!
    var currentViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(tabBarButtons.count > 0) {
            performSegueWithIdentifier("FirstVcIdentifier", sender: tabBarButtons[0])
        }
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let availableIdentifiers = ["FirstVcIdentifier", "SecondVcIdentifier", "ThirdVcIdentifier"]
        
        
        if(contains(availableIdentifiers, segue.identifier!)) {
            
            var currTag: Int
            
            if segue.identifier == "FirstVcIdentifier" {
                currTag = 1
            }
            else if segue.identifier == "SecondVcIdentifier" {
                currTag = 2
            }
            else {
                currTag = 3
            }
            
            for btn in tabBarButtons {
                if btn.tag != currTag {
                    btn.selected = false
                } else {
                    btn.selected = true
                }
                
            }
            
        }
    }
    
    
    
    
}