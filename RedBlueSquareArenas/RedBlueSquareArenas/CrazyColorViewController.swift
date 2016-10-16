//
//  CrazyColorViewController.swift
//  RedBlueSquareArenas
//
//  Created by Mindy Lou on 10/14/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class CrazyColorViewController: UIViewController {
    var crazySquareLabel: UILabel!
    let dogeButton: UIButton = UIButton(frame: CGRect(x: 5, y: 80, width: 120, height: 40))
    let showHideButton: UIButton = UIButton(frame: CGRect(x: 5, y: 130, width: 120, height: 40))
    var showHideCounter: Int = 0
    var dogeImageView: UIImageView!
    var dogeCounter:Int = 0
    var sizeOfSquareSlider: UISlider = UISlider(frame: CGRect(x: 150, y: 80, width: 200, height: 20))
    var squareDimension: CGFloat!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = getRandomColor()
        
        dogeButton.setTitle("Toggle doge!", for: UIControlState.normal)
        dogeButton.backgroundColor = getRandomColor()
        dogeButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        dogeButton.addTarget(self, action: #selector(changeDogeCounter), for: .touchUpInside)
        view.addSubview(dogeButton)
        
        showHideButton.setTitle("Show/Hide", for: UIControlState.normal)
        showHideButton.backgroundColor = getRandomColor()
        showHideButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        showHideButton.addTarget(self, action: #selector(changeShowHideCounter), for: .touchUpInside)
        view.addSubview(showHideButton)
        
        sizeOfSquareSlider.minimumValue = 2
        sizeOfSquareSlider.maximumValue = 100
        sizeOfSquareSlider.isContinuous = true
        sizeOfSquareSlider.tintColor = getRandomColor()
        sizeOfSquareSlider.value = 50
        sizeOfSquareSlider.addTarget(self, action: #selector(updateSquareDimension), for: .valueChanged)
        view.addSubview(sizeOfSquareSlider)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        if let location = touches.first?.location(in: view){
            if dogeCounter == 0 {
                if let workingSize = squareDimension {
                    crazySquareLabel = UILabel(frame: CGRect(x: 0, y: 0, width: workingSize, height: workingSize))
                }
                else {
                    crazySquareLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
                }
                crazySquareLabel.backgroundColor = getRandomColor()
                crazySquareLabel.center = location
                view.addSubview(crazySquareLabel)
            }
            
            else if dogeCounter == 1 {
                if let workingSize = squareDimension {
                    dogeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: workingSize, height: workingSize))
                }
                else {
                    dogeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
                }
                dogeImageView.image = #imageLiteral(resourceName: "doge")
                dogeImageView.center = location
                view.addSubview(dogeImageView)
            }
            
        }
    }
    
    func showHideViews() {
        for view in self.view.subviews as [UIView] {
            if view is UILabel || view is UIImageView {
                if showHideCounter == 0 {
                    view.alpha = 0
                }
                else {
                    view.alpha = 1
                }
            }
        }
    }
    
    func changeShowHideCounter() {
        if showHideCounter == 0 {
            showHideViews()
            showHideCounter = 1
        }
        else {
            showHideViews()
            showHideCounter = 0
        }
    }
    
    func updateSquareDimension() {
        squareDimension = CGFloat(sizeOfSquareSlider.value)
    }
    
    func changeDogeCounter() {
        if dogeCounter == 0 {
            dogeCounter = 1
        }
        else {
            dogeCounter = 0
        }
    }


    func getRandomColor() -> UIColor {
        let randomRed: CGFloat = CGFloat(drand48())
        let randomGreen: CGFloat = CGFloat(drand48())
        let randomBlue: CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
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
