//
//  ViewController.swift
//  EmployeeDirectory-Square
//
//  Created by Zhao Li on 8/19/22.
//

import UIKit
import SnapKit
import SwiftUI

public class SQEmployeeDirectoryViewController: UIViewController {
  
  public var tableView: UITableView!
  private let cellIdentifier = "SQContactCell"
  public var dataLoader: SQEmployeeDataLoaderProtocal = SQEmployeeDataLoader()
  public var employeeData: [SQEmployeeDataModel]?
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupNavigationItem()
  }
  
  private func setupNavigationItem() {
    self.navigationItem.title = "Employee Directory"
    let loadAllButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(loadEmployeeData(_:)));
    let loadMalformedButton = UIBarButtonItem(barButtonSystemItem: .pause, target: self, action: #selector(loadMalformedEmployeeData(_:)));
    self.navigationItem.rightBarButtonItems = [loadAllButton, loadMalformedButton]
  }
  
  private func setupTableView() {
    tableView = UITableView(frame: .zero);
    tableView.register(SQEmployeeDirectoryCell.self, forCellReuseIdentifier: cellIdentifier)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.separatorStyle = .none
    tableView.showsVerticalScrollIndicator = false
    self.view.addSubview(tableView)
    tableView.snp.makeConstraints { make in
      make.top.left.right.bottom.equalToSuperview()
    }
  }
  
  @objc func loadMalformedEmployeeData(_ sender: UIBarButtonItem) {
    dataLoader.LoadEmployeeData(shouldLoadMalformed: true) { data in
      self.employeeData = data
      self.tableView.reloadData()
    }
  }
  
  @objc func loadEmployeeData(_ sender: UIBarButtonItem) {
    dataLoader.LoadEmployeeData(shouldLoadMalformed: false) { data in
      self.employeeData = data
      self.tableView.reloadData()
    }
  }
}

// MARK: TableViewDelegate
extension SQEmployeeDirectoryViewController: UITableViewDelegate
{
  public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 88
  }
}

// MARK: TableViewDataSourece
extension SQEmployeeDirectoryViewController: UITableViewDataSource
{
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SQEmployeeDirectoryCell
    cell.employeeData = employeeData?[indexPath.row];
    return cell;
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return employeeData?.count ?? 0;
  }
}
