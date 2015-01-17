//
//  HomeViewController.swift
//  learning-swift
//
//  Created by Brendan McManus on 12/26/14.
//  Copyright (c) 2014 Brendan McManus. All rights reserved.
//

import UIKit
import ParseUI


class HomeViewController : UIViewController {
    
    @IBOutlet weak var WelcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background.png")!)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .ScaleAspectFit
        let image = UIImage(named: "emoteful-header-logo.png")
        imageView.image = image
        navigationItem.titleView = imageView
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
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