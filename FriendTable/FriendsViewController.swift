//
//  FriendsViewController.swift
//  FriendTable
//
//  Created by Mindy Lou on 10/21/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class Friend {
    
    var name: String
    var interests: [String]
    var age: Int
    
    init(name: String, interests: [String], age: Int) {
        self.name = name
        self.interests = interests
        self.age = age
    }
    
    func yearsOldString() -> String {
        return self.name + " is \(self.age) years old"
    }
    
    func interestsString() -> String {
        return self.name + "'s Interests"
    }
}

class FriendsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var friendsTableView: UITableView!
    var addFriendBarButton: UIBarButtonItem! = nil
    var friends = [Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Friends"
        view.backgroundColor = .white
        
        friendsTableView = UITableView(frame: view.frame)
        friendsTableView.dataSource = self
        friendsTableView.delegate = self
        friendsTableView.tableFooterView = UIView()
        view.addSubview(friendsTableView)
        
//        addFriendBarButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(showAddFriendPush))
//        
//        self.navigationItem.rightBarButtonItem = addFriendBarButton
        
        friends.append(Friend(name: "Alex", interests: ["horses", "running", "drawing"], age: 20))
        friends.append(Friend(name: "Allison", interests: ["rocks", "iced tea", "science olympiad"], age: 18))
        friends.append(Friend(name: "Ashley", interests: ["figure skating", "sweet potatoes", "playing with babies"], age: 19))
        friends.append(Friend(name: "Lindsey", interests: ["volleyball", "formula", "wine"], age: 19))
        friends.append(Friend(name: "Toekim", interests: ["dabbing", "slurpees", "baja"], age: 19))
        friends.append(Friend(name: "Tom", interests: ["mixology", "anagrams", "smash"], age: 19))

    }
    
    func showAddFriendPush() {
//        navigationController?.pushViewController(NewFriendViewController(), animated: true)
    }
    
    func addFriend(f: Friend) {
        friends.append(f)
//        friendsTableView.reloadData()
    }
    
    
    // required
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Reuse")
        cell.textLabel?.text = friends[indexPath.row].yearsOldString()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 40
        }
        return 60
    }
    
    // required
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    // required
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friend = friends[indexPath.row]
        
        let detailViewController = DetailViewController()
        detailViewController.friend = friend
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    

}
