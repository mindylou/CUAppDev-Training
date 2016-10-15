//
//  BlueViewController.swift
//  RedBlueSquareArenas
//
//  Created by Mindy Lou on 10/12/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    var blueSquareLabel: UILabel!
    let goBackToViewControllerButton: UIButton = UIButton(frame: CGRect(x: 5, y: 30, width: 50, height: 20))

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        goBackToViewControllerButton.titleLabel?.textAlignment = NSTextAlignment.center
        goBackToViewControllerButton.setTitle("Back", for: UIControlState.normal)
        goBackToViewControllerButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        goBackToViewControllerButton.addTarget(self, action: #selector(showViewControllerModal), for: .touchUpInside)
        view.addSubview(goBackToViewControllerButton)

    }
    func showViewControllerModal() {
        present(ViewController(), animated: true, completion: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view){
            blueSquareLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            blueSquareLabel.backgroundColor = UIColor.blue
            blueSquareLabel.center = location
            view.addSubview(blueSquareLabel)
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
