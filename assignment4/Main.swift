//
//  ViewController.swift
//  assignment4
//
//  Created by Matthew Helms on 4/13/16.
//  Copyright © 2016 Matthew Helms. All rights reserved.
//

import UIKit

class Main: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let manners = [
        Manner(title: "Eye Contact", description: "Find a nearby spot to fix your gaze. Looking at the bridge of the nose, an eyebrow, or just below the eyes will give the illusion of eye contact, without the intimidation of making actual eye contact. The other person won't be able to tell the difference, and you'll be able to focus on more important listening skills to be a good conversationalist.", image: UIImage(named:"eyes")!),
        Manner(title: "Giving Compliments", description: "Find something you genuinely like about the person. It’s easy enough to pick the first thing you notice about someone and compliment it. You could say “I like your shirt” or “Nice hair” to just about anyone, but a good compliment goes deeper. Take a moment and think about what you really admire about the person before you say anything. Your compliment will be appreciated if it’s clear you really mean what you say.", image: UIImage(named:"compliments")!),
        Manner(title: "Sneezing", description: "How to make yourself sneeze when you can’t. It happens many times that we want to sneeze but we couldn’t. Sometimes a sneeze just stuck at the tip of the nose. Sneezing can be triggered. Sneezing is a natural process, but you might want to sneeze by tickling some sneezing spots. Purpose of sneezing is to get rid of unwanted substances from the nose. Every individual has different sensitivity according to how an individual responds to different irritants. Follow few simple steps to make yourself sneeze:", image: UIImage(named:"sneezing")!),
        Manner(title: "Using the restroom", description: "Look into multiple stalls. When you first enter a public restroom, take a quick survey of the available stalls. Make a smart choice on what stall to use. Choose a stall that seems the cleanest. The toilet should be flushed, the seat should be dry and free of any visible debris and there should be toilet paper and seat protectors. Many times one or two stalls may be visible dirty or contaminated. These stalls should be avoided if possible. If your only option is to use a dirtier or unclean stall, use more precaution and employ as many safe use practices as possible.", image: UIImage(named:"restroom")!),
        Manner(title: "Saying 'Excuse Me'", description: "“Excuse me” is a phrase that can be used in various situations with various meanings.  Learn the different ways to use it, and learn how to say this phrase comfortably in conversational English: what words or syllables to reduce, how to link everything together, and the melodic shape of the phrase.", image: UIImage(named:"excuseme")!),
        Manner(title: "Eating", description: "Eat a balanced diet. Include a healthy balance of nutrient-rich carbohydrates such as fruits, vegetables, and roots like potatoes. This will help make sure your body gets the right balance of the vital vitamins and minerals it needs in order to keep you strong and healthy. The recommended balance varies from diet plan to diet plan, and your ideal balance may be a little different from someone else's.", image: UIImage(named:"eating")!),
        Manner(title: "Drinking", description: "Drink with a group of friends. If you want to drink responsibly, then the first thing you should do is avoid drinking alone, or drinking with people you don't really know or trust all that well. If you're out on your own and have no one looking out for you, you can get in all kinds of trouble without anyone even knowing something's wrong. Whether you're heading to a party or out to the bars, always make sure to drink with a group of people you like and trust.", image: UIImage(named:"drinking")!),
        Manner(title: "Asking Nicely", description: "When you're charming, you make another person feel good. Everyone likes to feel good, but when you want something you have to be very careful about how you employ your allure. As we've previously noted, complimenting someone before you ask for a favor makes you seem untrustworthy. The compliments fall flat because they sound, to the recipient, like you're only giving them because you want something. It's fine to compliment someone afterwards, but when it's the first thing out of your mouth it is ruined by asking for a favor. ", image: UIImage(named:"nicely")!),
        Manner(title: "Shaking hands", description: "Be the first to extend your hand. This makes a strong, lasting impression on the person at the receiving end. It is also about control; by offering your hand first, you are leading the way. This applies to both men and women; don't shy away for reasons of being coy or putting yourself down.", image: UIImage(named:"shaking")!),
    ]
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manners.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        cell.textLabel?.text = manners[indexPath.row].title
        cell.detailTextLabel?.text = manners[indexPath.row].description
        if (manners[indexPath.row].visited == true) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .DisclosureIndicator
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("detail", sender: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "detail") {
            (segue.destinationViewController as! Detail).manner = manners[sender!.row]
        } else if (segue.identifier == "mail") {
            (segue.destinationViewController as! Mail).manners = manners
        }
    }

}

class Manner {
    var title = ""
    var description = ""
    var image = UIImage()
    var visited = false
    
    init(title:String, description:String, image:UIImage) {
        self.title = title
        self.description = description
        self.image = image
    }
}