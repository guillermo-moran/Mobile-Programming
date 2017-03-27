//
//  FirstViewController.swift
//  Things
//
//  Created by Guillermo Moran on 3/27/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let VIEW_COLOR = UIColor(red:0.33, green:0.37, blue:0.45, alpha:1.0)

    let TEXT_COLOR = UIColor.white
    
    @IBOutlet weak var taskTable: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    func randomColor(alpha:CGFloat!)-> UIColor
    {
        return  UIColor.init(red:(CGFloat(arc4random_uniform(256))/255.0), green:CGFloat(arc4random_uniform(256))/255.0, blue: (CGFloat(arc4random_uniform(256))/255.0), alpha: alpha)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        taskTable.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTable.delegate = self;
        taskTable.dataSource = self;
        
        taskTable.backgroundColor = VIEW_COLOR
        taskTable.separatorColor = VIEW_COLOR.withAlphaComponent(0.4)
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        taskTable.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = UITableViewCell(style: .subtitle , reuseIdentifier: "taskCell")
        
        cell.backgroundColor = VIEW_COLOR
        cell.textLabel?.textColor = TEXT_COLOR
        cell.detailTextLabel?.textColor = TEXT_COLOR
        
        cell.textLabel?.text = taskMGR.tasks[indexPath.row].taskName
        cell.detailTextLabel?.text = taskMGR.tasks[indexPath.row].taskDescription
        
        let randomColor : UIColor = self.randomColor(alpha: 1.0)
        cell.imageView?.image = getImageWithColor(color: randomColor, size: CGSize(width: 40, height: 40))
        
        //round image view
        cell.imageView?.layer.cornerRadius = (cell.imageView?.frame.size.width)! / 2;
        cell.imageView?.clipsToBounds      = true;
        cell.imageView?.layer.borderWidth  = 1.0
        cell.imageView?.layer.borderColor  = UIColor.white.cgColor
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete) {
            
            taskMGR.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskMGR.tasks.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

