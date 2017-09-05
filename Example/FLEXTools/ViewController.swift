//
//  ViewController.swift
//  FLEXTools
//
//  Created by spf on 09/05/2017.
//  Copyright (c) 2017 spf. All rights reserved.
//

import UIKit
import FLEXTools

class ViewController: UIViewController {
    @IBAction func selectButton(_ sender: Any) {
        FLEXTools.instance.show()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

