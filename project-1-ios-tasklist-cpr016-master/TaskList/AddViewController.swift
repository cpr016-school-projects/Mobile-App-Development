//
//  AddViewController.swift
//  TaskList
//
//  Created by Cameron Rothwell on 2/12/20.
//  Copyright © 2020 Cameron Paul Rothwell. All rights reserved.
//

import UIKit


class AddViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let MainVC = segue.destination as! MainViewController
        if TitleText.text != "" {
            MainVC.add(title: TitleText.text!, date: DateOutlet.date, done: DoneSwitch.isOn)
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    @IBOutlet weak var DateOutlet: UIDatePicker!
    @IBOutlet weak var TitleText: UITextField!
    @IBOutlet weak var DoneSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

