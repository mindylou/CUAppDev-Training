//
//  FeedViewController.swift
//  ContactList
//
//  Created by Mindy Lou on 10/28/16.
//  Copyright © 2016 Mindy Lou. All rights reserved.
//

import UIKit

class Contact {
    var profileImage: UIImage
    var name: String
    var phoneNumber: String
    var email: String
    
    init(profileImage: UIImage, name: String, phoneNumber: String, email: String) {
        self.profileImage = profileImage
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
    }
}

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var contactList = [Contact]()
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Contacts"
        
        view.backgroundColor = .white
        
        tableView = UITableView(frame: view.frame)
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "Reuse")
        
        getContacts()
        
    }
    
    func getContacts() {
        contactList.append(Contact(profileImage: #imageLiteral(resourceName: "allison"), name: "Allison Alcott", phoneNumber: "123-456-7890", email: "allison@alcott.com"))
        contactList.append(Contact(profileImage: #imageLiteral(resourceName: "ashley"), name: "Ashley Chan", phoneNumber: "123-456-7890", email: "ashley@chan.com"))
        contactList.append(Contact(profileImage: #imageLiteral(resourceName: "kaili"), name: "Kaili Chen", phoneNumber: "123-456-7890", email: "kaili@chen.com"))
        contactList.append(Contact(profileImage: #imageLiteral(resourceName: "tom"), name: "Tom Chen", phoneNumber: "123-456-7890", email: "tom@chen.com"))
        contactList.append(Contact(profileImage: #imageLiteral(resourceName: "jean"), name: "Jean Ding", phoneNumber: "123-456-7890", email: "jean@ding.com"))
        contactList.append(Contact(profileImage: #imageLiteral(resourceName: "lindsey"), name: "Lindsey Frank", phoneNumber: "123-456-7890", email: "lindsey@drank.com"))
        contactList.append(Contact(profileImage: #imageLiteral(resourceName: "yeolim"), name: "Yeolim Jo", phoneNumber: "123-456-7890", email: "yeolim@jo.com"))
        contactList.append(Contact(profileImage: #imageLiteral(resourceName: "johan"), name: "Johan Kjorven", phoneNumber: "123-456-7890", email: "johan@kjorven.com"))
        contactList.append(Contact(profileImage: #imageLiteral(resourceName: "alex"), name: "Alex Pfaffle", phoneNumber: "123-456-7890", email: "alex@pfaffle.com"))
        contactList.append(Contact(profileImage: #imageLiteral(resourceName: "aditya"), name: "Aditya Shukla", phoneNumber: "123-456-7890", email: "aditya@shukla.com"))
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Reuse") as? ContactTableViewCell {
            let contact = contactList[indexPath.row]
            cell.setup(profileImage: contact.profileImage, name: contact.name, phone: contact.phoneNumber, email: contact.email)
            return cell
        }
        
        return ContactTableViewCell(style: .default, reuseIdentifier: "Reuse")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contactList[indexPath.row]
        
        let detailViewController = DetailViewController()
        detailViewController.contact = contact
        detailViewController.indexInList = indexPath.row
        
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contactList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func changeInfo(newNumber: String, newEmail: String, index: Int) {
        
    }
    

}
