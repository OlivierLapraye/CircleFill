//
//  ViewController.swift
//  CircleFillExample
//
//  Created by Olivier LAPRAYE on 18/11/2017.
//  Copyright © 2017 Olivier LAPRAYE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorSwitch: UISwitch!
    
    @IBAction func switchChanged(_ sender: Any) {
        if colorSwitch.isOn == true {
            view.fillBackgroundFrom(point: colorSwitch.center, with: UIColor.green)
        }
        else {
            view.emptyBackgroundTo(point: colorSwitch.center, with: UIColor.white, in: 0.5)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DO SOMETHING HERE
    }
}

