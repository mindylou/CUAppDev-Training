//
//  FaceMashFeedViewController.swift
//  FaceMash
//
//  Created by Mindy Lou on 11/3/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class Person {
    var name: String
    var image: UIImage
    
    init(name: String, image: UIImage){
        self.name = name
        self.image = image
    }
}

class FaceMashFeedViewController: UIViewController {

    var matchups = [[Person]]()
    var cards = [FaceMashView]()
    var touchLocation: CGPoint?
    var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        let api = API()
        api.getDataFromURL { (data: Data?) in
            if let unwrappedData = data {
                let dictionary = api.dictionaryFromData(data: unwrappedData)
                let matchups = api.matchupsFromDictionary(dictionary: dictionary)
                self.matchups = matchups
                
                self.addCardsToView()
            }
        }
        
        nextButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        nextButton.center = CGPoint(x: view.center.x, y: view.frame.height * 0.95)
        nextButton.layer.cornerRadius = 20
        nextButton.backgroundColor = .darkGray
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(showNextMatchup), for: .touchUpInside)
        nextButton.isEnabled = false
        nextButton.alpha = 0
        view.addSubview(nextButton)
        

    }
    
    func showNextMatchup() {
        UIView.animate(withDuration: 1, animations: {
            self.nextButton.alpha = 0
            self.nextButton.isEnabled = false
            
            self.cards[0].alpha = 0
            
            })
        self.cards.remove(at: 0)

        UIView.animate(withDuration: 1) {
            if self.cards.count >= 2 {
                self.cards[0].alpha = 1
                self.cards[1].alpha = 1
            }
        }
    }
    
    func addCardsToView() {
        DispatchQueue.main.async {
            for matchup in self.matchups {
                let cardOne = FaceMashView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width * 0.4, height: self.view.frame.height * 0.35))
                let cardTwo = FaceMashView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width * 0.4, height: self.view.frame.height * 0.35))
                
                cardOne.center = CGPoint(x: self.view.center.x * 0.5, y: self.view.center.y)
                cardTwo.center = CGPoint(x: self.view.center.x * 1.5, y: self.view.center.y)
                
                cardOne.setup(image: matchup[0].image, name: matchup[0].name)
                cardTwo.setup(image: matchup[1].image, name: matchup[1].name)
                
                self.view.addSubview(cardOne)
                self.view.addSubview(cardTwo)
                
                self.cards.insert(cardTwo, at: 0)
                self.cards.insert(cardOne, at: 0)
            }
            
            if self.cards.count >= 2 {
                let otherCards = self.cards[2...self.cards.count-1]
                for card in otherCards {
                    card.alpha = 0
                }
            }
        }
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view) {
            if cards.count != 0 {
                let cardOne = cards[0]
                let cardTwo = cards[1]

                
                if cardOne.frame.contains(location) {
                    touchLocation = location
                    
                    UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 3.0, options: .curveEaseInOut, animations: {
                        cardOne.center = self.view.center
                        cardOne.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                    })
                    UIView.animate(withDuration: 0.7, animations: {
                        cardTwo.center = self.view.center
                        self.view.sendSubview(toBack: cardTwo)
                        cardTwo.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                        }, completion: { (_) in
                            cardTwo.removeFromSuperview()
                            self.cards.remove(at: 1)
                    })
                    
                }
                else if cardTwo.frame.contains(location) {
                    touchLocation = location
                    
                    UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 3.0, options: .curveEaseInOut, animations: {
                        cardTwo.center = self.view.center
                        cardTwo.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)

                    })
                    UIView.animate(withDuration: 0.7, animations: {
                        cardOne.center = self.view.center
                        self.view.sendSubview(toBack: cardOne)
                        cardOne.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                        }, completion: { (_) in
                            cardOne.removeFromSuperview()
                            self.cards.remove(at: 0)
                    })
                }
                UIView.animate(withDuration: 0.5, animations: {
                    self.nextButton.alpha = 1
                    self.nextButton.isEnabled = true
                })
                
            }
            
        }

    }

}
