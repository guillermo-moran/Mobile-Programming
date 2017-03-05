//
//  DetailViewController.swift
//  PortolioApp
//
//  Created by Guillermo Moran on 2/28/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pageTitle : String!
    var link: String!
    var descriptionText: String!
    
    var image1 : UIImage?
    var image2 : UIImage?
    var image3 : UIImage?
    
    @IBOutlet weak var first_screeine: UIImageView!
    @IBOutlet weak var second_screenie: UIImageView!
    @IBOutlet weak var third_screenie: UIImageView!
    
    var linksArray = ["Visit Website"]
    
    @IBOutlet weak var linksTable: UITableView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let SUBTITLE_COLOR = UIColor(red:0.63, green:0.65, blue:0.72, alpha:1.0)
    let TEXT_COLOR = UIColor.white
    let SELECTION_COLOR = UIColor(red:0.41, green:0.37, blue:0.47, alpha:1.0)

    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = pageTitle
        
        descriptionTextView.text = descriptionText
        
        linksTable.delegate   = self
        linksTable.dataSource = self
        linksTable.backgroundColor = self.view.backgroundColor
        linksTable.isScrollEnabled = false
        
        descriptionTextView.isEditable = false
        descriptionTextView.isSelectable = false
        
        first_screeine.image = image1
        second_screenie.image = image2
        third_screenie.image = image3
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(_:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)

        // Do any additional setup after loading the view.
    }
    
    func swiped(_ gesture: UIGestureRecognizer) {
        back(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back(_ sender: Any) {
        
        self.navigationController!.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return linksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = linksArray[indexPath.row]
        cell.textLabel?.textColor = TEXT_COLOR
        cell.backgroundColor = self.view.backgroundColor
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = SELECTION_COLOR
        cell.selectedBackgroundView = bgColorView
        
        if (indexPath.row == 0) {
            cell.imageView?.image = UIImage(named: "safari")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        openBrowser(title: "More Info", link: link)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func openBrowser(title : String, link : String) {
        
        let browserVC = self.storyboard?.instantiateViewController(withIdentifier: "browserVC")
            as! BrowserViewController
        
        browserVC.titleString = title
        browserVC.linkString  = link
        
        self.show(browserVC, sender: nil)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
