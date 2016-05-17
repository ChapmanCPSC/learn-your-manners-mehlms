//
//  Settings.swift
//  assignment4
//
//  Created by Matthew Helms on 5/16/16.
//  Copyright © 2016 Matthew Helms. All rights reserved.
//

import UIKit

class Settings: UIViewController {
    
    @IBOutlet weak var switchThing: UISwitch!
    
    @IBOutlet weak var dark: UILabel!
    @IBOutlet weak var light: UILabel!
    
    
    override func viewDidLoad() {
        self.title = "Settings"
        switchThing.on = Theme.light
        switched(self)
    }
    
    
    @IBAction func switched(sender: AnyObject) {
        Theme.light = switchThing.on
        Theme.defaults.setBool(Theme.light, forKey: "light")
        if (Theme.light) {
            dark.textColor = UIColor.blackColor()
            light.textColor = UIColor.blackColor()
            self.view.backgroundColor = UIColor.whiteColor()
            self.navigationController?.navigationBar.barStyle = UIBarStyle.Default
            self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        } else {
            dark.textColor = UIColor.whiteColor()
            light.textColor = UIColor.whiteColor()
            self.view.backgroundColor = UIColor.blackColor()
            self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
            self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        }
    }
}