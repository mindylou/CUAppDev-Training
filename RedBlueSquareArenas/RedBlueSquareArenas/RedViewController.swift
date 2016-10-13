//
//  RedViewController.swift
//  RedBlueSquareArenas
//
//  Created by Mindy Lou on 10/12/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    var redSquareLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view) {
            redSquareLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            redSquareLabel.backgroundColor = UIColor.red
            redSquareLabel.center = location
            view.addSubview(redSquareLabel)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
