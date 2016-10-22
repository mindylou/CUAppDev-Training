//
//  EditInterestViewController.swift
//  FriendTable
//
//  Created by Mindy Lou on 10/21/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class EditInterestViewController: UIViewController {
    var friend: Friend!
    var indexOfInterest: Int!
    var interestTextField: UITextField!
    var changeInterestButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Edit Interest"
        
        interestTextField = UITextField(frame: CGRect(x: 20, y: 85, width: 300, height: 30))
        interestTextField.center = CGPoint(x: view.center.x, y: 85)
        interestTextField.borderStyle = .roundedRect
        interestTextField.clearsOnBeginEditing = true
        interestTextField.text = friend.interests[indexOfInterest]
        view.addSubview(interestTextField)
        
        changeInterestButton = UIButton(frame: CGRect(x: 0, y: 0, width: 160, height: 30))
        changeInterestButton.setTitle("Change Interest", for: .normal)
        changeInterestButton.addTarget(self, action: #selector(updateInterest), for: .touchUpInside)
        changeInterestButton.setTitleColor(.cyan, for: .normal)
        changeInterestButton.center = CGPoint(x: view.center.x, y: 150)
        view.addSubview(changeInterestButton)
    }
    
    func updateInterest() {
        if let differentInterest = interestTextField.text {
            friend.interests[indexOfInterest] = differentInterest
        }
    }

}
