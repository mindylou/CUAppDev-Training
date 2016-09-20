//
//  ViewController.swift
//  Hello World
//
//  Created by Mindy Lou on 9/19/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ThisDumbButton: UIButton!

    @IBAction func AButton(_ sender: AnyObject) {
        //IB: Interface Builder
        print("You just clicked a button")
        
        ThisDumbButton.setTitle("HELLO WORLD", for: UIControlState.normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Hello World")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

