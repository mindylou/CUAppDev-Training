//
//  DetailViewController.swift
//  FriendTable
//
//  Created by Mindy Lou on 10/21/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var friend: Friend?
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = friend?.interestsString()
        view.backgroundColor = .white
        tableView = UITableView(frame: view.frame)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfInterests = friend?.interests.count {
            return numberOfInterests
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Reuse")
        cell.textLabel?.text = friend?.interests[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editInterestViewController = EditInterestViewController()
        editInterestViewController.friend = friend
        editInterestViewController.indexOfInterest = indexPath.row
        
        navigationController?.pushViewController(editInterestViewController, animated: true)
        
    }

}
