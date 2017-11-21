//
//  Example2.swift
//  CircleFillExample
//
//  Created by Olivier LAPRAYE on 21/11/2017.
//  Copyright © 2017 Olivier LAPRAYE. All rights reserved.
//

import UIKit

class Example2: UIViewController {
    
    @IBOutlet weak var basicView: UIView!
    
    @IBAction func buttonTapped(_ sender: Any) {
        basicView.fillBackgroundFrom(point: basicView.frame.origin, with: UIColor.blue)
    }
}
