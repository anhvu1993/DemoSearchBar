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
    Student(name: "", phone: <#T##String#>)]
    func updateSearchResults(for searchController: UISearchController) {
        return
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
       makeSearchBar()
    }
    func makeSearchBar() {
     searchController.searchResultsUpdater = self
     searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.placeholder = "Search"
        searchController.delegate = self
        searchController.searchBar.delegate = self
        tableView.reloadData()
    }
    func searchbar() -> Bool {
        searchController.searchBar.text?.isEmpty ?? true
    }
    func fiterforSearchBar(_ searchText: String, scope: String = "All") {
        
        
    }
    


}
extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(number[indexPath.row])
        return cell
    }
    
}
