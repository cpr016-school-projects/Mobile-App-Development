//
//  MainViewController.swift
//  TaskList
//
//  Created by Cameron Rothwell on 2/21/20.
//  Copyright © 2020 Cameron Paul Rothwell. All rights reserved.
//

import UIKit



class MainViewController: UITableViewController {

    // Variables
    var tasks: [Task] = []
    
    // Actions and Outlets
    @IBOutlet var TableViewOutlet: UITableView!
    
    @IBAction func unwindToMainViewController(sender: UIStoryboardSegue) {
    }
    
    @IBAction func CellButtonPress(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is EditViewController {
            let EditVC = segue.destination as! EditViewController

            let index = sender as! UIButton

            EditVC.tasktitle = tasks[index.tag].title
            EditVC.date = tasks[index.tag].date
            EditVC.done = tasks[index.tag].done
            EditVC.currCell = index.tag
        }
    }
    
    // --------------
    //   Functions
    
    // edits a task. called from EditViewController
    func edit(title: String!, date: Date!, done: Bool!, index: Int?) {
        tasks[index!].title = title
        tasks[index!].date = date
        tasks[index!].done = done
        
        let indexPath = IndexPath(row: index!, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! Cell
        
        if tasks[indexPath.row].done {
            cell.ButtonOutlet.backgroundColor = UIColor.lightGray
            cell.DateLabel.backgroundColor = UIColor.lightGray
        } else {
            cell.ButtonOutlet.backgroundColor = UIColor.white
            cell.DateLabel.backgroundColor = UIColor.white
        }
        sortTasks()
        TableViewOutlet.reloadData()
    }
    
    // adds a task. Called from AddViewController
     func add(title: String, date: Date, done: Bool) {
        let toAdd = Task()
        toAdd.title = title
        toAdd.date = date
        toAdd.done = done
        tasks.append(toAdd)
        sortTasks()
        TableViewOutlet.reloadData()
    }
    
    override func viewDidLoad() {
        //create example tasks here
        tasks.append(Task(
            title: "Grandma's Presents",
            date: Date.init(timeInterval: 3000, since: Date.init()),
            done: true)
        )
        tasks.append(Task(
            title: "Grandma's food",
            date: Date.init(timeInterval: 100000000, since: Date.init()),
            done: false)
        )
        tasks.append(Task(
            title: "Grandpa's Food",
            date: Date.init(timeIntervalSinceNow: 345600),
            done: false)
        )
        tasks.append(Task(
            title: "Valentines cards",
            date: Date.init(timeIntervalSinceNow: 200000),
            done: false)
        )
        tasks.append(Task(
            title: "Valentines cards",
            date: Date.init(timeIntervalSinceNow: 100000),
            done: true)
        )
        
        sortTasks()
    }
    
    // sorts the tasks array
    func sortTasks() {
        tasks.sort{ $0.date < $1.date }
        tasks.sort{!$0.done && $1.done}
    }
    		
    
    // swipe gestures
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let complete = completeAction(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [complete])
        
    }
    
    // swipe gesture helper
    func completeAction(at indexPath: IndexPath) -> UIContextualAction {

        let action = UIContextualAction(style: .normal, title: "Done") {
            (action, view, completion) in
            self.tasks[indexPath.row].done = !self.tasks[indexPath.row].done
            self.sortTasks()
            self.TableViewOutlet.reloadData()
        }
        action.backgroundColor = self.tasks[indexPath.row].done ? .gray : .green
        
        
        return action
    }
    
    //fill out the task cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        
//        cell.indexPath = indexPath.row
        // add indexpath to button tag so I can retrieve it for Edit
        cell.ButtonOutlet.tag = indexPath.row
        
            
        cell.ButtonOutlet.setTitle(tasks[indexPath.row].title, for: UIControl.State.normal)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        
        cell.DateLabel.text = dateFormatter.string(from: tasks[indexPath.row].date)

        //add color background
        if tasks[indexPath.row].done {
            cell.ButtonOutlet.backgroundColor = UIColor.lightGray
            cell.DateLabel.backgroundColor = UIColor.lightGray
        } else {
            cell.ButtonOutlet.backgroundColor = UIColor.white
            cell.DateLabel.backgroundColor = UIColor.white
        }
        
        return cell
    }
    
    // return tasks count
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
}


// The actual task class. Has a sort of "wrapper" around it: The Cell class
class Task {
    var title = ""
    var done  = false
    var date = Date()
    var indexPath: Int?
    
    convenience init(title: String, date: Date, done: Bool) {
        self.init()
        self.title = title
        self.date = date
        self.done = done
    }
}
