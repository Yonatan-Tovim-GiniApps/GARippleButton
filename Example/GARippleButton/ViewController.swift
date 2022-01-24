//
//  ViewController.swift
//  GARippleButton
//
//  Created by lidorf-gini-apps on 01/24/2022.
//  Copyright (c) 2022 lidorf-gini-apps. All rights reserved.
//

import UIKit
import GARippleButton

class ViewController: UIViewController
{
    @IBOutlet weak var outlineButton    : GAOutlinedButton!
    @IBOutlet weak var circleButton     : GACircleButton!
    @IBOutlet weak var textButton       : GATextButton!
    @IBOutlet weak var containedButton  : GAContainedButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

