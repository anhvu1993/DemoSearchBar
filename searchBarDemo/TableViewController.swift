//
//  ViewController.swift
//  searchBarDemo
//
//  Created by Anh vũ on 5/17/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
     var students = [Student(name: "Anh vu", phone: "0974488151"),
                     Student(name: "Van dong", phone: "0399252253"),
                     Student(name: "Trinh", phone: "0964514655"),
                     Student(name: "Quang vu", phone: "0326866756")]
    
    var fiterStudent = [Student]()
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
       makeSearchBar()
    }
    func makeSearchBar() {
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = false
//        searchController.hidesNavigationBarDuringPresentation = false
//        searchController.dimsBackgroundDuringPresentation = false
//        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.placeholder = "Search"
        searchController.delegate = self
        searchController.searchBar.delegate = self
        tableView.reloadData()
    }
    func searchbar() -> Bool {
      return  searchController.searchBar.text?.isEmpty ?? true
    }
    func fiterforSearchBar(_ searchText: String, scope: String = "All") {
        fiterStudent = students.filter({ (student: Student) -> Bool in
            return student.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()

    }
    func isfitering() -> Bool {
        return searchController.isActive && !searchbar()
    }
    func updateSearchResults(for searchController: UISearchController) {
        fiterforSearchBar(searchController.searchBar.text!)
    }
}
extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isfitering() {
          return  fiterStudent.count
        }
        return students.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var listStudent: Student
        
        if isfitering() {
           listStudent = fiterStudent[indexPath.row]
        } else {
            listStudent = students[indexPath.row]
        }
        cell.textLabel?.text = listStudent.name
        cell.detailTextLabel?.text = listStudent.phone
        return cell
    }
    
}
