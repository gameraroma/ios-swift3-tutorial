//
//  ViewController.swift
//  PracticeTableView
//
//  Created by Chakpiwat Pacharajindawat on 164//60 BE.
//  Copyright © 2560 Codium. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func setTextLabel(_ sender: UIButton) {
        nameLabel.text = nameTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

