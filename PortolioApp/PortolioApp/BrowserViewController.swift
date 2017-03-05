//
//  BrowserViewController.swift
//  PortolioApp
//
//  Created by Guillermo Moran on 3/3/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class BrowserViewController: UIViewController {
    
    var titleString : String!
    var linkString  : String!
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = titleString
        
        let url = NSURL (string: linkString);
        let requestObj = NSURLRequest(url: url! as URL);
        webView.loadRequest(requestObj as URLRequest);
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(_:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)

        // Do any additional setup after loading the view.
    }
    
    func swiped(_ gesture: UIGestureRecognizer) {
        back(self)
    }
    
    @IBAction func back(_ sender: Any) {
        
        self.navigationController!.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openInSafari(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Links", message: "What would you like to do?", preferredStyle: .actionSheet)
        
        let safariButton = UIAlertAction(title: "Open In Safari", style: .default, handler: { (action) -> Void in
            
            let url = URL(string: self.linkString)
            
            UIApplication.shared.open(url!, options: [:])
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(safariButton)
        alertController.addAction(cancelButton)
        
        self.navigationController!.present(alertController, animated: true, completion: nil)
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
