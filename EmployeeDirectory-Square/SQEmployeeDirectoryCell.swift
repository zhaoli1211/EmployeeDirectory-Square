//
//  SQEmployeeDirectoryCell.swift
//  EmployeeDirectory-Square
//
//  Created by Zhao Li on 8/19/22.
//

import UIKit
import SnapKit

class SQEmployeeDirectoryCell: UITableViewCell {
  
  var employeeData : EmployeeDataModel? {
    didSet {
      employeeNameLabel.text = employeeData?.fullName
      employeePhoneLabel.text = employeeData?.phoneNumber
      employeeEmailLabel.text = employeeData?.emailAddress
      employeeBiographyLabel.text = employeeData?.biography
    }
  }
  
  private let employeePhoto : UIImageView = {
    let imgView = UIImageView(image: nil)
    imgView.contentMode = .scaleAspectFit
    imgView.clipsToBounds = true
    imgView.layer.cornerRadius = imgView.bounds.size.height * 0.5
    return imgView
   }()
  
  private let employeeNameLabel : UILabel = {
    let lable = UILabel()
    lable.textColor = .black
    lable.font = UIFont.boldSystemFont(ofSize: 14)
    lable.textAlignment = .left
    return lable
  }()
      
  private let employeePhoneLabel : UILabel = {
    let lable = UILabel()
    lable.textColor = .black
    lable.font = UIFont.systemFont(ofSize: 12)
    lable.textAlignment = .left
    lable.numberOfLines = 0

    return lable
  }()
  
  private let employeeEmailLabel : UILabel = {
    let lable = UILabel()
    lable.textColor = .black
    lable.font = UIFont.systemFont(ofSize: 12)
    lable.textAlignment = .left

    return lable
  }()
      
  private let employeeBiographyLabel : UILabel = {
    let lable = UILabel()
    lable.textColor = .black
    lable.font = UIFont.systemFont(ofSize: 12)
    lable.textAlignment = .justified
    lable.numberOfLines = 0
    lable.sizeToFit()

    return lable
  }()
      
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.addSubview(employeePhoto)
    contentView.addSubview(employeeNameLabel)
    contentView.addSubview(employeePhoneLabel)
    contentView.addSubview(employeeEmailLabel)
    contentView.addSubview(employeeBiographyLabel)
    
    employeePhoto.snp.makeConstraints { make in
      make.top.left.equalToSuperview().offset(4)
      make.bottom.equalToSuperview().offset(-4)
      make.width.equalTo(employeePhoto.snp.height)
    }
    
    employeeNameLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(4)
      make.right.equalToSuperview().offset(-4)
      make.left.equalTo(employeePhoto.snp.right).offset(8)
      make.height.equalTo(16)
    }
    
    employeePhoneLabel.snp.makeConstraints { make in
      make.top.equalTo(employeeNameLabel.snp.bottom)
      make.left.equalTo(employeePhoto.snp.right).offset(8)
      make.right.equalToSuperview().offset(-4)
      make.height.equalTo(16)
    }
    
    employeeEmailLabel.snp.makeConstraints { make in
      make.top.equalTo(employeePhoneLabel.snp.bottom)
      make.right.equalToSuperview().offset(-4)
      make.left.equalTo(employeePhoto.snp.right).offset(8)
      make.height.equalTo(16)
    }
    
    // TODO: change the label size base on text
    employeeBiographyLabel.snp.makeConstraints { make in
      make.top.equalTo(employeeEmailLabel.snp.bottom)
      make.right.equalToSuperview().offset(-4)
      make.left.equalTo(employeePhoto.snp.right).offset(8)
      make.bottom.equalToSuperview().offset(-4)
    }
  }
      
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
