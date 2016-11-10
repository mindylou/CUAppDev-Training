//
//  API.swift
//  FaceMash
//
//  Created by Mindy Lou on 11/9/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class API {
    
    let dataURLString = "https://raw.githubusercontent.com/dennisfedorko/test-json/master/matchups.json"
    
    func getDataFromURL(completion: @escaping (Data?) -> ()) {
        
        if let url = URL(string: dataURLString) {
            
            let urlRequest = URLRequest(url: url)
            let session = URLSession.shared
            
            let task = session.dataTask(with: urlRequest, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
                
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        completion(data)
                    }
                }
            })
            
            task.resume()
        }
    }
    
    func dictionaryFromData(data: Data) -> [String: Any] {
        
        if let jsonSerialization = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
            if let dictionary = jsonSerialization as? [String: Any] {
                return dictionary
            }
        }
        
        return [String: Any]()
    }
    
    func matchupsFromDictionary(dictionary: [String: Any]) -> [[Person]] {
        var matchupList = [[Person]]()
        
        if let matchupArray = dictionary["matchups"] as? [[String: Any]] {
            
            for matchupJSON in matchupArray {
                
                if let firstPerson = matchupJSON["first_person"] as? [String: Any],
                let secondPerson = matchupJSON["second_person"] as? [String: Any]{
                    
                if let nameOne = firstPerson["name"] as? String,
                    let photoURLStringOne = firstPerson["photo"] as? String,
                    let nameTwo = secondPerson["name"] as? String,
                    let photoURLStringTwo = secondPerson["photo"] as? String {
                            
                    if let imageOne = getImageFromURLString(urlString: photoURLStringOne),
                        let imageTwo = getImageFromURLString(urlString: photoURLStringTwo) {
                    
                        var personArray = [Person]()
                        personArray.append(Person(name: nameOne, image: imageOne))
                        personArray.append(Person(name: nameTwo, image: imageTwo))
                    
                        matchupList.append(personArray)
                        }
                    
                    }
                }
            }
        }
        
        return matchupList
    }
    
    func getImageFromURLString(urlString: String) -> UIImage? {
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                return UIImage(data: data)
            }
        }
        return nil
    }

}
