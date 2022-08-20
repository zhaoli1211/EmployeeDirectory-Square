//
//  SQEmployeeDataLoader.swift
//  EmployeeDirectory-Square
//
//  Created by Zhao Li on 8/19/22.
//

import Alamofire

class SQEmployeeDataLoader: NSObject {
  let employeeUrl = "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json"
  
  override init() {
    super.init()
  }
  
  public func LoadEmployeeData(completion: @escaping ([SQEmployeeDataModel]?) -> Void) {
    AF.request(employeeUrl).responseDecodable(of:SQAllEmployeeData.self ) { response in
       switch response.result {
         case .success(let data):
         completion(data.empoyeeData)
         case .failure(let error):
           completion(nil)
         }
    }
  }
}
