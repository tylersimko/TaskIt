//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Tyler Simko on 10/7/14.
//  Copyright (c) 2014 O8 Labs. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    var mainViewController: ViewController!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addTaskButtonTapped(sender: UIButton) {
        
        var task = TaskModel(task: taskTextField.text, description: descriptionTextField.text, date: dueDatePicker.date)
        mainViewController.taskArray.append(task)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
