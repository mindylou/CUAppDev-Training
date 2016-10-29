//
//  DetailViewController.swift
//  ContactList
//
//  Created by Mindy Lou on 10/28/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var contact: Contact!
    var indexInList: Int!
    
    var profilePhotoImageView: UIImageView!
    
    var nameLabel: UILabel!
    
    var phoneNumberLabel: UILabel!
    var phoneNumberField: UITextField!
    
    var emailLabel: UILabel!
    var emailField: UITextField!
    
    var doneEditingBarButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Edit " + contact.name
        
        setup()
        
    }
    
    func setup() {
        profilePhotoImageView = UIImageView(image: contact.profileImage)
        profilePhotoImageView.frame = CGRect(x: 135, y: 85, width: 100, height: 100)
        profilePhotoImageView.center.x = self.view.center.x
        profilePhotoImageView.layer.masksToBounds = true
        profilePhotoImageView.layer.cornerRadius = profilePhotoImageView.frame.width/2.0
        view.addSubview(profilePhotoImageView)
        
        nameLabel = UILabel(frame: CGRect(x: 100, y: 185, width: 200, height: 50))
        nameLabel.text = contact.name
        nameLabel.font = nameLabel.font.withSize(30)
        nameLabel.center.x = self.view.center.x
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        
        phoneNumberLabel = UILabel(frame: CGRect(x: 20, y: 275, width: 150, height: 30))
        phoneNumberLabel.text = "mobile"
        phoneNumberLabel.textColor = .black
        view.addSubview(phoneNumberLabel)
        
        phoneNumberField = UITextField(frame: CGRect(x: 20, y: 305, width: 300, height: 30))
        phoneNumberField.text = contact.phoneNumber
        phoneNumberField.textColor = self.view.tintColor
        phoneNumberField.borderStyle = .none
        view.addSubview(phoneNumberField)
        
        emailLabel = UILabel(frame: CGRect(x: 20, y: 345, width: 150, height: 30))
        emailLabel.textColor = .black
        emailLabel.text = "email"
        view.addSubview(emailLabel)
        
        emailField = UITextField(frame: CGRect(x: 20, y: 375, width: 300, height: 30))
        emailField.text = contact.email
        emailField.textColor = self.view.tintColor
        emailField.borderStyle = .none
        view.addSubview(emailField)
        
        doneEditingBarButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(updateContact
            ))
        self.navigationItem.rightBarButtonItem = doneEditingBarButton

    }
    
    func updateContact() {
        if let differentNumber = phoneNumberField.text, let differentEmail = emailField.text {
            contact.phoneNumber = differentNumber
            contact.email = differentEmail
            
//            let feed = FeedViewController()
//            feed.changeInfo(newNumber: differentNumber, newEmail: differentEmail, index: indexInList)
            
        }
    }

}
