//
//  EmployeeDirectory_SquareTests.swift
//  EmployeeDirectory-SquareTests
//
//  Created by Zhao Li on 8/19/22.
//

import XCTest

@testable import EmployeeDirectory_Square

class EmployeeDirectory_SquareTests: XCTestCase {
  
  var viewController : SQEmployeeDirectoryViewController!

  override func setUpWithError() throws {
    try super.setUpWithError()
    viewController = SQEmployeeDirectoryViewController()
  }

  override func tearDownWithError() throws {
    viewController = nil;
    
    try super.tearDownWithError()
  }

  func testTableViewNotNil() throws {
    viewController.viewDidLoad()
    XCTAssertEqual(viewController.view.subviews.count, 1)
    let tableView = viewController.view.subviews[0] as? UITableView
    viewController.dataLoader = SQEmployeeDataLoaderMock()
    XCTAssertNotNil(tableView)
    XCTAssertTrue(tableView?.numberOfRows(inSection: 0) == 0)
  }
  
  func testTableViewDataLoad() throws {
    viewController.viewDidLoad()
    XCTAssertEqual(viewController.view.subviews.count, 1)
    let tableView = viewController.view.subviews[0] as? UITableView
    viewController.dataLoader = SQEmployeeDataLoaderMock()
    XCTAssertNotNil(tableView)
    viewController.dataLoader.LoadEmployeeData(shouldLoadMalformed: false) { data in
      self.viewController.employeeData = data
      tableView?.reloadData()
    }
    XCTAssertTrue(tableView?.numberOfRows(inSection: 0) == 1)
    let cell = tableView?.cellForRow(at: IndexPath(row: 0, section: 0)) as? SQEmployeeDirectoryCell
    XCTAssertNotNil(cell)
  }
}

class SQEmployeeDataLoaderMock: SQEmployeeDataLoaderProtocal {
   func LoadEmployeeData(shouldLoadMalformed: Bool, completion: @escaping ([SQEmployeeDataModel]?) -> Void) {
    let employeeModel = SQEmployeeDataModel(uuid: "213", fullName: "213", photoUrlSmall: "213", photoUrlLarge: "213", phoneNumber: "213", emailAddress: "213", biography: "213", team: "213", employeeType: "213")
    completion([employeeModel])
  }
}
