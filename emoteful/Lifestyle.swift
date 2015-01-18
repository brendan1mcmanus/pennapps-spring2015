//
//  Body.swift
//  emoteful
//
//  Created by Brendan McManus on 1/17/15.
//  Copyright (c) 2015 Brendan McManus. All rights reserved.
//

import Foundation
import UIKit
import ParseUI


class Lifestyle: UIViewController {
    @IBOutlet weak var stressedIcon: UILabel!
    @IBOutlet weak var angryIcon: UILabel!
    @IBOutlet weak var sadIcon: UILabel!
    @IBOutlet weak var happyIcon: UILabel!
    @IBOutlet weak var mehIcon: UILabel!
    @IBOutlet weak var worriedIcon: UILabel!
    
    var happy:Double = Double()
    var sad: Double = Double()
    var worried:Double = Double()
    var stressed:Double = Double()
    var angry:Double = Double()
    var meh:Double = Double()
    var count:Double = Double()
    
    
    override func viewDidLoad() {
        updateTheEmotions()
    }
    
    
    private func updateTheEmotions() {
        var query = PFQuery(className:"database")
        query.getObjectInBackgroundWithId("V65tMqnwrD") {
            (database: PFObject!, error: NSError!) -> Void in
            if error == nil {
                self.happy = database["happyCount"] as Double
                self.sad = database["sadCount"] as Double
                self.worried = database["worriedCount"] as Double
                self.stressed = database["stressedCount"] as Double
                self.angry = database["angryCount"] as Double
                self.meh = database["mehCount"] as Double
                self.count =  self.happy + self.sad + self.worried + self.self.stressed + self.angry + self.meh
                self.happy = self.happy / self.count * 100
                self.sad = self.sad / self.count * 100
                self.worried = self.worried / self.count * 100
                self.angry = self.angry / self.count * 100
                self.meh = self.meh / self.count * 100
                self.stressed = self.stressed / self.count * 100
                
                var b:String = String(format:"%.0f", self.stressed)
                self.stressedIcon.text = b + "%"

                var c:String = String(format:"%.0f", self.happy)
                self.happyIcon.text = c + "%"

                var d:String = String(format:"%.0f", self.sad)
                self.sadIcon.text = d + "%"

                var e:String = String(format:"%.0f", self.angry)
                self.angryIcon.text = e + "%"

                var f:String = String(format:"%.0f", self.meh)
                self.mehIcon.text = f + "%"

                var g:String = String(format:"%.0f", self.worried)
                self.worriedIcon.text = g + "%"
            } else {
                NSLog("%@", error)
            }
        }
    }
    
}