//
//  FaceMashFeedViewController.swift
//  FaceMash
//
//  Created by Mindy Lou on 11/3/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class Person {
    var name: String
    var image: UIImage
    
    init(name: String, image: UIImage){
        self.name = name
        self.image = image
    }
}

class FaceMashFeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
