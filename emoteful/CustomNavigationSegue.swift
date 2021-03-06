//
//  CustomNavigationSegue.swift
//  learning-swift
//
//  Created by Brendan McManus on 1/16/15.
//  Copyright (c) 2015 Brendan McManus. All rights reserved.
//

import UIKit

class CustomNavigationSegue: UIStoryboardSegue {
    
    override func perform() {
        
        let tabBarController = self.sourceViewController as CustomTabBar
        let destinationController = self.destinationViewController as UIViewController
        
        for view in tabBarController.placeholderView.subviews as [UIView] {
            view.removeFromSuperview()
        }
        
        // Add view to placeholder view
        tabBarController.currentViewController = destinationController
        tabBarController.placeholderView.addSubview(destinationController.view)
        
        // Set autoresizing
        tabBarController.placeholderView.setTranslatesAutoresizingMaskIntoConstraints(false)
        destinationController.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let horizontalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": destinationController.view])
        
        tabBarController.placeholderView.addConstraints(horizontalConstraint)
        
        let verticalConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[v1]-0-|", options: .AlignAllTop, metrics: nil, views: ["v1": destinationController.view])
        
        tabBarController.placeholderView.addConstraints(verticalConstraint)
        
        tabBarController.placeholderView.layoutIfNeeded()
        destinationController.didMoveToParentViewController(tabBarController)
        
    }
    
}

