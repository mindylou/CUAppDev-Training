//
//  ViewController.swift
//  StudentsList
//
//  Created by Mindy Lou on 10/1/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class Student {
    var name:String
    var year:String
    var major:String
    var GPA:String
    
    init(name:String, year:String, major:String, GPA:String){
        self.name = name
        self.year = year
        self.major = major
        self.GPA = GPA
    }
}

class ViewController: UIViewController {

    let nameLabel = UILabel(frame: CGRect(x: 15, y: 50, width: 60, height: 20))
    let yearLabel = UILabel(frame: CGRect(x: 15, y: 100, width: 60, height: 20))
    let majorLabel = UILabel(frame: CGRect(x: 15, y: 150, width: 60, height: 20))
    let gpaLabel = UILabel(frame: CGRect(x: 15, y: 200, width: 60, height: 20))
    
    let nameField = UITextField(frame: CGRect(x: 90, y: 47, width: 265, height: 25))
    let yearField = UITextField(frame: CGRect(x: 90, y: 97, width: 265, height: 25))
    let majorField = UITextField(frame: CGRect(x: 90, y: 147, width: 265, height: 25))
    let gpaField = UITextField(frame: CGRect(x: 90, y: 197, width: 265, height: 25))
    
    let addStudentInfoButton = UIButton(frame: CGRect(x: 120, y: 250, width: 140, height: 25))
    
    let studentInformationLabel = UILabel(frame: CGRect(x: 104, y: 350, width: 250, height: 25))
    
    let studentDescriptions:UITextView = UITextView(frame: CGRect(x: 15, y: 375, width: 345, height: 300))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.white
        addUIElements()
    }
    
    func addUIElements(){
        nameLabel.text = "Name:"
        view.addSubview(nameLabel)
        
        nameField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(nameField)
        
        yearLabel.text = "Year:"
        view.addSubview(yearLabel)
        
        yearField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(yearField)
        
        majorLabel.text = "Major:"
        view.addSubview(majorLabel)
        
        majorField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(majorField)
        
        gpaLabel.text = "GPA:"
        view.addSubview(gpaLabel)
        
        gpaField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(gpaField)
        
        
        addStudentInfoButton.addTarget(self, action: #selector(addTextFieldsToScreen), for: .touchUpInside)
        addStudentInfoButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        addStudentInfoButton.setTitle("Add Student", for: UIControlState.normal)
        addStudentInfoButton.titleLabel?.textAlignment = NSTextAlignment.center
        view.addSubview(addStudentInfoButton)
        
        studentInformationLabel.text = "Student Information"
        studentInformationLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(studentInformationLabel)
        
        studentDescriptions.isEditable = true
        studentDescriptions.textAlignment = NSTextAlignment.center
        studentDescriptions.text = ""
        view.addSubview(studentDescriptions)
        
    }
    
    func initializeStudentAndReturnString(nom:String, yr:String, maj:String, gpa:String) -> String{
        let newStudent = Student(name: nom, year: yr, major: maj, GPA: gpa)
        
        return newStudent.name + " is majoring in " + newStudent.major + " with a " + newStudent.GPA
    }
    
    func addTextFieldsToScreen(){
        if (nameField.text! == "" || yearField.text! == "" || majorField.text! == "" || gpaField.text! == "") {
        }
        else{
            studentDescriptions.text = studentDescriptions.text + "\n" + initializeStudentAndReturnString(nom: nameField.text!, yr: yearField.text!, maj: majorField.text!, gpa: gpaField.text!)
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

