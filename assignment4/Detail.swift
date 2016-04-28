//
//  Detail.swift
//  assignment4
//
//  Created by Matthew Helms on 4/27/16.
//  Copyright © 2016 Matthew Helms. All rights reserved.
//

import UIKit

class Detail: UIViewController {

    var manner : Manner?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionTxt: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = manner?.title
        image.image = manner?.image
        descriptionTxt.text = manner?.description
        manner?.visited = true
    }

}
