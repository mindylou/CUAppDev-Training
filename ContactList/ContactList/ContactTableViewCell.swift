//
//  ContactTableViewCell.swift
//  ContactList
//
//  Created by Mindy Lou on 10/28/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    var profileImageView: UIImageView!
    var nameLabel: UILabel!
    var phoneNumberLabel: UILabel!
    var emailLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .white
        selectionStyle = .none
        
        profileImageView = UIImageView()
        nameLabel = UILabel()
        phoneNumberLabel = UILabel()
        emailLabel = UILabel()
        
        profileImageView.clipsToBounds = true
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(phoneNumberLabel)
        addSubview(emailLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.frame = CGRect(x: 0, y: 0, width: frame.height/2.0, height: frame.height/2.0)
        profileImageView.center = CGPoint(x: frame.height/2, y: frame.height/2.0)
        // change corner radius
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2.0
        
        nameLabel.frame = CGRect(x: profileImageView.frame.origin.x + profileImageView.frame.width + 10, y: frame.height * 0.25, width: frame.width * 0.5, height: frame.height * 0.25)
        
        phoneNumberLabel.frame = CGRect(x: nameLabel.frame.origin.x, y: nameLabel.frame.origin.y + nameLabel.frame.height, width: nameLabel.frame.width, height: 15.0)
        phoneNumberLabel.font = phoneNumberLabel.font.withSize(12.0)
        
        emailLabel.frame = CGRect(x: nameLabel.frame.origin.x, y: nameLabel.frame.origin.y + nameLabel.frame.height + phoneNumberLabel.frame.height, width: nameLabel.frame.width, height: 15.0)
        emailLabel.font = emailLabel.font.withSize(12.0)
        
    }
    
    func setup(profileImage: UIImage, name: String, phone: String, email: String){
        
        profileImageView.image = profileImage
        nameLabel.text = name
        phoneNumberLabel.text = phone
        emailLabel.text = email 
        
    }

}
