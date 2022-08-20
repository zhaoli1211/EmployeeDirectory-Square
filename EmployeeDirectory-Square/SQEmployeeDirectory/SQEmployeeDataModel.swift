//
//  EmployeeDataModel.swift
//  EmployeeDirectory-Square
//
//  Created by Zhao Li on 8/19/22.
//

import Foundation

public struct SQAllEmployeeData: Decodable {
  let empoyeeData : [SQEmployeeDataModel]
   enum CodingKeys: String, CodingKey {
      case empoyeeData = "employees"
   }
}

public struct SQEmployeeDataModel: Decodable {
  enum CodingKeys: String, CodingKey {
    case uuid = "uuid"
    case fullName = "full_name"
    case photoUrlSmall = "photo_url_small"
    case photoUrlLarge = "photo_url_large"
    case phoneNumber = "phone_number"
    case emailAddress = "email_address"
    case biography = "biography"
    case team = "team"
    case employeeType = "employee_type"
  }
  let uuid : String?
  let fullName : String?
  let photoUrlSmall : String?
  let photoUrlLarge : String?
  let phoneNumber : String?
  let emailAddress : String?
  let biography : String?
  let team : String?
  let employeeType : String?
}
