//
//  ViewController.swift
//  StudentsList
//
//  Created by Mindy Lou on 10/1/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let labelWidth:CGFloat = 60
    let labelHeight:CGFloat = 20
    let labelX:CGFloat = 15
    
    let fieldX:CGFloat = 90
    let fieldWidth:CGFloat = 265
    let fieldHeight:CGFloat = 25
    
    let addStudentInfoX:CGFloat = 120
    let addStudentInfoY:CGFloat = 250
    let addStudentInfoWidth:CGFloat = 140
    let addStudentInfoHeight:CGFloat = 25
    
    let studentInformationLabelX:CGFloat = 104
    let studentInformationLabelY:CGFloat = 350
    let studentInformationLabelWidth:CGFloat = 250
    let studentInformationLabelHeight:CGFloat = 25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.white
        addUIElements()
    }
    
    func addUIElements(){
        let nameLabel = UILabel(frame: CGRect(x: labelX, y: 50, width: labelWidth, height: labelHeight))
        nameLabel.text = "Name:"
        view.addSubview(nameLabel)
        
        let nameField = UITextField(frame: CGRect(x: fieldX, y: 47, width: fieldWidth, height: fieldHeight))
        nameField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(nameField)
        
        let yearLabel = UILabel(frame: CGRect(x: labelX, y: 100, width: labelWidth, height: labelHeight))
        yearLabel.text = "Year:"
        view.addSubview(yearLabel)
        
        let yearField = UITextField(frame: CGRect(x: fieldX, y: 97, width: fieldWidth, height: fieldHeight))
        yearField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(yearField)
        
        let majorLabel = UILabel(frame: CGRect(x: labelX, y: 150, width: labelWidth, height: labelHeight))
        majorLabel.text = "Major:"
        view.addSubview(majorLabel)
        
        let majorField = UITextField(frame: CGRect(x: fieldX, y: 147, width: fieldWidth, height: fieldHeight))
        majorField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(majorField)
        
        let gpaLabel = UILabel(frame: CGRect(x: labelX, y: 200, width: labelWidth, height: labelHeight))
        gpaLabel.text = "GPA:"
        view.addSubview(gpaLabel)
        
        let gpaField = UITextField(frame: CGRect(x: fieldX, y: 197, width: fieldWidth, height: fieldHeight))
        gpaField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(gpaField)
        
        let addStudentInfoButton = UIButton(frame: CGRect(x: addStudentInfoX, y: addStudentInfoY, width: addStudentInfoWidth, height: addStudentInfoHeight))
        addStudentInfoButton.addTarget(self, action: #selector(addTextFieldsToScreen), for: .touchUpInside)
        addStudentInfoButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        addStudentInfoButton.setTitle("Add Student", for: UIControlState.normal)
        addStudentInfoButton.titleLabel?.textAlignment = NSTextAlignment.center
        view.addSubview(addStudentInfoButton)
        
        let studentInformationLabel = UILabel(frame: CGRect(x: studentInformationLabelX, y: studentInformationLabelY, width: studentInformationLabelWidth, height: studentInformationLabelHeight))
        studentInformationLabel.text = "Student Information"
        studentInformationLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(studentInformationLabel)
        
    }
    
    func addTextFieldsToScreen(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

