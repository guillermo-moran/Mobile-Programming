//
//  ViewController.swift
//  PortolioApp
//
//  Created by Guillermo Moran on 2/27/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//
// https://coolors.co/fafef7-bad29f-8b94a7-2c497f-3d2b56

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let VIEW_COLOR      = UIColor(red:0.24, green:0.17, blue:0.34, alpha:1.0)
    let SELECTION_COLOR = UIColor(red:0.41, green:0.37, blue:0.47, alpha:1.0)
    let SUBTITLE_COLOR  = UIColor(red:0.63, green:0.65, blue:0.72, alpha:1.0)
    let TEXT_COLOR      = UIColor.white
    
    @IBOutlet weak var projectsTable    : UITableView!
    @IBOutlet weak var linksTable       : UITableView!
    @IBOutlet weak var profileImageView : UIImageView!
    
    
    // Projects
    
    var projectsArray     = ["Eclipse", "AppDrawer", "Lithium"]
    
    var descriptionsArray = ["Universal Nightmode for iOS 7 - 10", "Android's App Drawer for iOS 6 - 10", "Battery Extension for Apple Watch"]
    
    var projectLinks = ["http://cydia.saurik.com/package/org.thebigboss.eclipse4/",
                        "http://cydia.saurik.com/package/org.thebigboss.appdrawer/",
                        "https://itunes.apple.com/us/app/lithium-battery-stats-on-your/id1032633817?mt=8"]
    
    var projectDescriptions = [
        
        //Eclipse 10
        "Personalize your device with Eclipse 4, a system-wide night mode for iOS 10! Finally, get rid of that ugly white, retina-burning interface that we all know and hate!\n\nEclipse 4 allows you to change the color scheme of (most) applications, with support for more being added weekly!\n\nEclipse 4 features:\n- Built for iOS 10\n- Lightweight tweak, consumes NO battery life!\n- Support for many popular App Store apps (with more being added soon!)\n- System-wide colorization\n- User-customizable settings\n- Activator and flipswitch toggles\n\nContact @fr0st on twitter for bug reports and feature requests!\n\nFree if purchased Eclipse , Eclipse 2, or Eclipse 3",
        //AppDrawer
        "Compatible with iOS 8, 9 and 10 \n\nNot compatible with iPads\n\nAppDrawer is an Android-esque application drawer for iOS. Place AppDrawer’s icon wherever you want for quick and easy access to an alphabetized list of your installed applications.\n\nFeatures:\n\n- Support for WinterBoard\n- You pick which applications are in your app drawer (hide them in Settings).\n- Place your favorite applications in a separate “Favorites” tab\n- Beautiful, native-looking interface\n- Hide springboard icons\n\nFollow @fr0st on twitter for updates!\n\nConfigure in Settings.",
        
        //Lithium
        "Lithium - Battery stats on your wrist\n\nLithium allows you to quickly check your iPhone’s battery by simply glancing at your wrist. A simple, familiar interface on the Apple Watch allows you to do so without ever having to get your phone out of your pocket.\n\nFeatures:\n\n- Receive notifications when your battery is full on your Apple Watch.\n- Receive low battery notifications on your Apple Watch.\n- Quickly check your battery with the Apple Watch app or Glances on your watch face.\n- Simple interface for quick, easy, and painless access."]
    
    // About Me
    
    var linksArray = ["Website", "Twitter", "Github"]
    var linksDescription = ["gmoran.me", "@fr0st", "@fr0stdev"]
    var aboutMeURLS = ["http://gmoran.me", "http://twitter.com/fr0st", "http://github.com/fr0stdev"]
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Rounded profile picture image 
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
        self.profileImageView.clipsToBounds      = true;
        self.profileImageView.layer.borderWidth  = 3.0
        self.profileImageView.layer.borderColor  = UIColor.white.cgColor
        
        //Projects Table
        projectsTable.delegate        = self
        projectsTable.dataSource      = self
        projectsTable.backgroundColor = self.view.backgroundColor
        projectsTable.isScrollEnabled = false

        //Links Table
        linksTable.delegate        = self
        linksTable.dataSource      = self
        linksTable.backgroundColor = self.view.backgroundColor
        linksTable.isScrollEnabled = false
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectsArray.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC")
            as! DetailViewController
        
        //detailVC.modalTransitionStyle = .flipHorizontal
        
        var title       : String = ""
        var link        : String = ""
        var description : String = ""
        
        let index = indexPath.row
        
        if (tableView == projectsTable) {
            
            title       = projectsArray[index]
            link        = projectLinks[index]
            description = projectDescriptions[index]
            
            var image1 : UIImage? = nil
            var image2 : UIImage? = nil
            var image3 : UIImage? = nil
            
            if (index == 0) { //Eclipse
                image1 = #imageLiteral(resourceName: "eclipse4-1")
                image2 = #imageLiteral(resourceName: "eclipse4-2")
                image3 = #imageLiteral(resourceName: "eclipse4-3")
            }
            if (index == 1) { //AppDrawer
                image1 = #imageLiteral(resourceName: "appdrawer-1")
                image2 = #imageLiteral(resourceName: "appdrawer-2")
                image3 = #imageLiteral(resourceName: "appdrawer-3")
            }
            if (index == 2) {
                image1 = #imageLiteral(resourceName: "lithium-1")
                image2 = #imageLiteral(resourceName: "lithium-3")
                image3 = #imageLiteral(resourceName: "lithium-2")
            }
            
            detailVC.pageTitle       = title
            detailVC.link            = link
            detailVC.descriptionText = description
            
            detailVC.image1 = image1
            detailVC.image2 = image2
            detailVC.image3 = image3
            
            
            self.show(detailVC, sender: nil)
        }
        
        else {
            title = linksArray[index]
            link = aboutMeURLS[index]
            self.openBrowser(title: title, link: link)

        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView    == projectsTable) {
            
            let tableCell = UITableViewCell(style: .subtitle, reuseIdentifier: "projects")
            
            tableCell.backgroundColor = self.view.backgroundColor
            
            tableCell.textLabel?.text            = projectsArray[indexPath.row]
            tableCell.detailTextLabel?.text      = descriptionsArray[indexPath.row]
            
            tableCell.textLabel?.textColor       = TEXT_COLOR
            tableCell.detailTextLabel?.textColor = SUBTITLE_COLOR
            
            let bgColorView                      = UIView()
            bgColorView.backgroundColor          = SELECTION_COLOR
            tableCell.selectedBackgroundView     = bgColorView
            
            var image : UIImage = UIImage()
            let index = indexPath.row
            
            if (index == 0) { //Eclipse 
                image = UIImage(named: "eclipse")!
            }
            if (index == 1) { //AppDrawer
                image = UIImage(named: "appdrawer")!
            }
            if (index == 2) { //Lithium
                image = UIImage(named: "lithium")!
            }
            
            tableCell.imageView?.image = image
            tableCell.accessoryType    = .disclosureIndicator
            
            
            return tableCell
        }
        
        else { // About Me Table
            
            let tableCell = UITableViewCell(style: .subtitle, reuseIdentifier: "links")
            
            tableCell.backgroundColor            = self.view.backgroundColor
            
            tableCell.textLabel?.text            = linksArray[indexPath.row]
            tableCell.detailTextLabel?.text      = linksDescription[indexPath.row]
            
            tableCell.textLabel?.textColor       = UIColor.white
            tableCell.detailTextLabel?.textColor = UIColor(red:0.63, green:0.65, blue:0.72, alpha:1.0)
            
            let bgColorView                      = UIView()
            bgColorView.backgroundColor          = SELECTION_COLOR
            tableCell.selectedBackgroundView     = bgColorView
            
            var image : UIImage = UIImage()
            let index = indexPath.row
            
            if (index == 0) { //Website
                image = UIImage(named: "gmoran")!
            }
            if (index == 1) { //Twitter
                image = UIImage(named: "twitter")!
            }
            if (index == 2) { //Github
                image = UIImage(named: "github")!
            }
            
            tableCell.imageView?.image = image
            tableCell.accessoryType    = .disclosureIndicator
            
            return tableCell
            
        }
        
    }
    
    
    func openBrowser(title : String, link : String) {
        
        let browserVC = self.storyboard?.instantiateViewController(withIdentifier: "browserVC")
            as! BrowserViewController
        
        browserVC.titleString = title
        browserVC.linkString  = link
        
        self.show(browserVC, sender: nil)
        
    }

}

