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
    
    let crazySquareArenaButton: UIButton = UIButton(frame: CGRect(x: 90, y: 350, width: 200, height: 20))

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
        
        crazySquareArenaButton.titleLabel?.textAlignment = NSTextAlignment.center
        crazySquareArenaButton.setTitle("Crazy Square Arena", for: UIControlState.normal)
        crazySquareArenaButton.setTitleColor(getRandomColor(), for: UIControlState.normal)
        crazySquareArenaButton.addTarget(self, action: #selector(showCrazyColorViewControllerPush), for: .touchUpInside)
        view.addSubview(crazySquareArenaButton)
    }
    
    func getRandomColor() -> UIColor {
        let randomRed: CGFloat = CGFloat(drand48())
        let randomGreen: CGFloat = CGFloat(drand48())
        let randomBlue: CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    func showRedViewControllerPush() {
        navigationController?.pushViewController(RedViewController(), animated: true)
        
    }
    
    func showBlueViewControllerModal() {
        present(BlueViewController(), animated: true, completion: nil)
        // There is something wrong with this because it's not going back properly
    }
    
    func showBlueViewControllerPush() {
        navigationController?.pushViewController(BlueViewController(), animated: true)
    }

    func showCrazyColorViewControllerPush() {
        navigationController?.pushViewController(CrazyColorViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

