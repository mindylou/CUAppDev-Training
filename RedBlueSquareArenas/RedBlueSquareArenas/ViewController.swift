//
//  ViewController.swift
//  RedBlueSquareArenas
//
//  Created by Mindy Lou on 10/12/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let redSquareArenaButton: UIButton = UIButton(frame: CGRect(x: 90, y: 250, width: 200, height: 20))
    
    let blueSquareArenaButton: UIButton = UIButton(frame: CGRect(x: 90, y: 300, width: 200, height: 20))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        
        addUIElements()
    }
    
    func addUIElements() {
        redSquareArenaButton.titleLabel?.textAlignment = NSTextAlignment.center
        redSquareArenaButton.setTitle("Red Square Arena", for: UIControlState.normal)
        redSquareArenaButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        redSquareArenaButton.addTarget(self, action: #selector(showRedViewControllerPush),
                                       for: .touchUpInside)
        view.addSubview(redSquareArenaButton)
        
        blueSquareArenaButton.titleLabel?.textAlignment = NSTextAlignment.center
        blueSquareArenaButton.setTitle("Blue Square Arena", for: UIControlState.normal)
        blueSquareArenaButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        blueSquareArenaButton.addTarget(self, action: #selector(showBlueViewControllerPush),
                                        for: .touchUpInside)
        view.addSubview(blueSquareArenaButton)
    }
    
    func showRedViewControllerPush() {
        navigationController?.pushViewController(RedViewController(), animated: true)
    }
    
    func showBlueViewControllerPush() {
        navigationController?.pushViewController(BlueViewController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

