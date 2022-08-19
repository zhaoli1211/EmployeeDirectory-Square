//
//  ViewController.swift
//  EmployeeDirectory-Square
//
//  Created by Zhao Li on 8/19/22.
//

import UIKit

class SQEmployeeDirectoryViewController: UIViewController {
  
  private var tableView: UITableView!
  private let cellIdentifier = "SQContactCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    
  }
  
  private func setupTableView() {
    tableView = UITableView(frame: self.view.bounds);
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.backgroundColor = UIColor.lightGray;
    self.view.addSubview(tableView)
  }
}

// MARK: TableViewDelegate
extension SQEmployeeDirectoryViewController: UITableViewDelegate
{
  
}

// MARK: TableViewDataSourece
extension SQEmployeeDirectoryViewController: UITableViewDataSource
{
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    return cell;
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1;
  }
}
