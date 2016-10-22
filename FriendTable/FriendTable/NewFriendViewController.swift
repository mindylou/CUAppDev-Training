//
//  NewFriendViewController.swift
//  FriendTable
//
//  Created by Mindy Lou on 10/21/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class NewFriendViewController: UIViewController {
    var nameLabel: UILabel!
    var nameTextField: UITextField!
    var addFriendButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Add a Friend"
        view.backgroundColor = .white
        addUIElements()
    }
    
    func addUIElements() {
        nameLabel = UILabel(frame: CGRect(x: 15, y: 85, width: 60, height: 20))
        nameLabel.text = "Name:"
        view.addSubview(nameLabel)
        
        nameTextField = UITextField(frame: CGRect(x: 90, y: 82, width: 265, height: 25))
        nameTextField.borderStyle = .roundedRect
        view.addSubview(nameTextField)
        
        addFriendButton = UIButton(frame: CGRect(x: 125, y: 150, width: 120, height: 20))
        addFriendButton.addTarget(self, action: #selector(addFriendToList), for: .touchUpInside)
        addFriendButton.setTitle("Add Friend", for: .normal)
        addFriendButton.setTitleColor(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1), for: UIControlState.normal)
        view.addSubview(addFriendButton)
        
    }
    
    func addFriendToList() {
        if let nameText = nameTextField.text {
            let newFriend = Friend(name: nameText, interests: ["eating"], age: 0)
            FriendsViewController().addFriend(f: newFriend)
        }
        
    }

}
