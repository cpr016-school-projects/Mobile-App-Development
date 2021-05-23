//
//  Cell.swift
//  TaskList
//
//  Created by Cameron Rothwell on 2/21/20.
//  Copyright © 2020 Cameron Paul Rothwell. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    var indexPath: Int?
    
    @IBOutlet weak var ButtonOutlet: UIButton!
    @IBOutlet weak var DateLabel: UILabel!
}
