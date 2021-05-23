//
//  EditViewController.swift
//  TaskList
//
//  Created by Cameron Rothwell on 2/21/20.
//  Copyright © 2020 Cameron Paul Rothwell. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var TitleText: UITextField!
    @IBOutlet weak var DateOutlet: UIDatePicker!
    @IBOutlet weak var DoneSwitch: UISwitch!
    

    var tasktitle:String?
    var date:Date?
    var done:Bool?
    var currCell:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleText.text = tasktitle
        DateOutlet.date = date ?? Date.init()
        DoneSwitch.isOn = done ?? false
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let MainVC = segue.destination as! MainViewController
        if TitleText.text != "" {
            MainVC.edit(title: TitleText.text!, date: DateOutlet.date, done: DoneSwitch.isOn, index: currCell!)
            navigationController?.popViewController(animated: true)
        }
    }
}

