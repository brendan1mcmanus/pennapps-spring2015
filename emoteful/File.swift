//
//  File.swift
//  learning-swift
//
//  Created by Brendan McManus on 1/16/15.
//  Copyright (c) 2014 Brendan McManus. All rights reserved.
//

import Foundation
import ParseUI
import UIKit

class File : PFLogInViewController {
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        
        let newLogo = UIImage(named: "emoteful.png")
        
        self.logInView.logo = UIImageView(image: newLogo)
    }
    
    
}