//
//  SettingsViewController.swift
//  emoteful
//
//  Created by Brendan McManus on 1/16/15.
//  Copyright (c) 2015 Brendan McManus. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    let kAPIExplorerID = "02Z1p-jM0AI" as NSString
    let kAPIExplorerSecret = "cb74fe51ba74ffc68343e33a067d1a542399d98f" as NSString
    var startingDate:NSDate = NSDate()
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background.png")!)
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
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

    
}