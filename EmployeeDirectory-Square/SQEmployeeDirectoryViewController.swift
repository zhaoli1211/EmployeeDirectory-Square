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
  private var dataLoader: SQEmployeeDataLoader!
  private var employeeData: [EmployeeDataModel]?

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    dataLoader = SQEmployeeDataLoader()
    dataLoader.LoadEmployeeData { data in
      self.employeeData = data
      self.tableView.reloadData()
    }
  }
  
  private func setupTableView() {
    tableView = UITableView(frame: self.view.bounds);
    tableView.register(SQEmployeeDirectoryCell.self, forCellReuseIdentifier: cellIdentifier)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.backgroundColor = UIColor.lightGray;
    self.view.addSubview(tableView)
  }
}

// MARK: TableViewDelegate
extension SQEmployeeDirectoryViewController: UITableViewDelegate
{
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 88
  }
}

// MARK: TableViewDataSourece
extension SQEmployeeDirectoryViewController: UITableViewDataSource
{
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    return cell;
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return employeeData?.count ?? 0;
  }
}
