//
//  ViewController.swift
//  TaskIt
//
//  Created by Tyler Simko on 10/7/14.
//  Copyright (c) 2014 O8 Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var taskArray: [TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(year: 2014, month: 10, day: 07)
        let date2 = Date.from(year: 2014, month: 10, day: 08)
        let date3 = Date.from(year: 2014, month: 10, day: 17)
        
        let task1 = TaskModel(task: "Study French", description: "verbs", date: date1)
        let task2 = TaskModel(task: "Eat dinner", description: "Burgers", date: date2)
        let task3 = TaskModel(task: "Gym", description: "Leg Day", date: date3)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        taskArray = [task1, task2, task3]
        
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        //called everytime view shows
        super.viewDidAppear(animated)
        
        //embedded function
    //    func sortByDate(taskOne: TaskModel, taskTwo: TaskModel) -> Bool {
      //      return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
       // }
      //  taskArray = taskArray.sorted(sortByDate)
        
        taskArray = taskArray.sorted {
            (taskOne:TaskModel, taskTwo:TaskModel) -> Bool in
            // comparison logic here
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //called right before new VC is presented on screen
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            let detailViewController: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = taskArray[indexPath!.row]
            detailViewController.detailsTaskModel = thisTask
            detailViewController.mainViewController = self
        } else if segue.identifier == "showTaskAdd" {
            let addTaskViewController: AddTaskViewController = segue.destinationViewController as AddTaskViewController
            addTaskViewController.mainViewController = self
        }
    }
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("showTaskAdd", sender: self)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let thisTask = taskArray[indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.description
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
    
    //Helpers
    
    
}

