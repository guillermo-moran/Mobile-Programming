//
//  TaskManager.swift
//  Things
//
//  Created by Guillermo Moran on 3/27/17.
//  Copyright © 2017 Guillermo Moran. All rights reserved.
//  https://coolors.co/2b303a-80c450-509bc4-c45050-545e72

import UIKit

var taskMGR : TaskManager = TaskManager()

struct taskStruct {
    var taskName = "-null title-"
    var taskDescription = "-null desc-"
    
}

class TaskManager: UIViewController {
    
    var tasks = [taskStruct]()
    
    func addTask(name: String, description: String) {
        tasks.append(taskStruct(taskName: name, taskDescription: description))
    }

}
