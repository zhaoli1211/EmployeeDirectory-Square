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
  public var emptyStateView: UIView!

  private let cellIdentifier = "SQContactCell"
  public var dataLoader: SQEmployeeDataLoaderProtocal = SQEmployeeDataLoader()
  public var employeeData: [SQEmployeeDataModel]? {
    didSet {
      tableView.isHidden = employeeData?.count == 0
      emptyStateView.isHidden = !(employeeData?.count == 0)
    }
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    setupEmptyStateView()
    setupTableView()
    setupNavigationItem()
    employeeData = []
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
  
  private func setupEmptyStateView() {
    emptyStateView = UIView(frame: .zero)
    let nullStateLable = UILabel(frame: .zero)
    nullStateLable.text = "Please tap + icon to load"
    nullStateLable.textAlignment = .center
    nullStateLable.font = UIFont.systemFont(ofSize: 16)
    nullStateLable.textColor = .black
    self.view.addSubview(emptyStateView)
    emptyStateView.snp.makeConstraints { make in
      make.top.right.bottom.left.equalToSuperview()
    }
    emptyStateView.addSubview(nullStateLable)
    nullStateLable.snp.makeConstraints { make in
      make.center.equalToSuperview()
      make.width.equalToSuperview()
      make.height.equalTo(16)
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
