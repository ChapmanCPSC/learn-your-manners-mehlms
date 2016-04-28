//
//  Mail.swift
//  assignment4
//
//  Created by Matthew Helms on 4/27/16.
//  Copyright © 2016 Matthew Helms. All rights reserved.
//

import UIKit
import MessageUI

class Mail: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var email: UITextField!
    
    var manners : [Manner]?
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Send Report"
        email.becomeFirstResponder()
        
        if let lastEmail = defaults.stringForKey("email") {
            email.text = lastEmail
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        defaults.setValue(email.text, forKey: "email")
    }
    
    @IBAction func sendEmail(sender: AnyObject) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([email.text!])
            var body = "Finished Activities: \n"
            for i in 0..<manners!.count {
                if (manners![i].visited) {
                    body += manners![i].title + "\n"
                }
            }
            mail.setMessageBody(body, isHTML: false)
            
            presentViewController(mail, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
}
