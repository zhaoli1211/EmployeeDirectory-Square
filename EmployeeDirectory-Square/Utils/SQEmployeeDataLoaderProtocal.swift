//
//  SQEmployeeDataLoaderProtocal.swift
//  EmployeeDirectory-Square
//
//  Created by Zhao Li on 8/19/22.
//

import Foundation

public protocol SQEmployeeDataLoaderProtocal {
  func LoadEmployeeData(shouldLoadMalformed : Bool, completion: @escaping ([SQEmployeeDataModel]?) -> Void)
}
