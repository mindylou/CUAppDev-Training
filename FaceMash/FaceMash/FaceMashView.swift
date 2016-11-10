//
//  FaceMashView.swift
//  FaceMash
//
//  Created by Mindy Lou on 11/4/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class FaceMashView: UIView {
    var imageView: UIImageView!
    var nameLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        layer.cornerRadius = 10
        
        backgroundColor = .white
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.9))
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        addSubview(imageView)
        
        nameLabel = UILabel(frame: CGRect(x: 0, y: frame.height * 0.9, width: frame.width * 0.9, height: frame.height * 0.1))
        nameLabel.center = CGPoint(x: frame.width/2.0, y: nameLabel.center.y)
        nameLabel.textAlignment = .center
        nameLabel.baselineAdjustment = .alignCenters
        addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(image: UIImage, name: String) {
        imageView.image = image
        nameLabel.text = name
    }
}
