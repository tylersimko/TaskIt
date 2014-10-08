//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Tyler Simko on 10/7/14.
//  Copyright (c) 2014 O8 Labs. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    var detailsTaskModel: TaskModel!
    var mainViewController: ViewController!

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.taskTextField.text = detailsTaskModel.task
        self.descriptionTextField.text = detailsTaskModel.description
        self.dueDatePicker.date = detailsTaskModel.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    @IBAction func doneBarButtonItemPressed(sender: UIBarButtonItem) {
        
        var task = TaskModel(task: taskTextField.text, description: descriptionTextField.text, date: dueDatePicker.date)
        mainViewController.taskArray[mainViewController.tableView.indexPathForSelectedRow()!.row] = task
        self.navigationController?.popViewControllerAnimated(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
