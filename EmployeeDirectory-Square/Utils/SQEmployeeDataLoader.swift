//
//  SQEmployeeDataLoader.swift
//  EmployeeDirectory-Square
//
//  Created by Zhao Li on 8/19/22.
//

import Alamofire

class SQEmployeeDataLoader: SQEmployeeDataLoaderProtocal  {
  func LoadEmployeeData(shouldLoadMalformed : Bool, completion: @escaping ([SQEmployeeDataModel]?) -> Void) {
    AF.request(shouldLoadMalformed ? malformedUrl : employeeUrl).responseDecodable(of:SQAllEmployeeData.self ) { response in
       switch response.result {
         case .success(let data):
         completion(data.empoyeeData)
         case .failure(_):
           completion(nil)
         }
    }
  }
}
