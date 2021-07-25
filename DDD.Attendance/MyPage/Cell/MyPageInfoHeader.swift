//
//  MyPageInfoHeader.swift
//  DDD.Attendance
//
//  Created by 황재욱 on 2021/07/13.
//  Copyright © 2021 DDD. All rights reserved.
//

import UIKit

import Then

final class MyPageInfoHeader: UICollectionReusableView {
  
  // MARK: - UI Components
  
  private let profileImageView = UIImageView().then {
    $0.contentMode = .scaleAspectFit
  }
  
  private let cameraIconImageView = UIImageView().then {
    $0.contentMode = .scaleAspectFit
  }
  
  private let userNameLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 24, weight: .bold)
    $0.textColor = .darkBlack
  }
  
  private let positionLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .lightGray
  }
  
  private let attendanceTitleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .lightGray
    $0.text = "출석횟수"
  }
  
  private let absenseTitleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .lightGray
    $0.text = "결석횟수"
  }
  
  private let noShowCostTitleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .lightGray
    $0.text = "노쇼비용"
  }
  
  private let attendanceCountLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 24, weight: .bold)
    $0.textColor = .darkBlack
  }
  
  private let absenseCountLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 24, weight: .bold)
    $0.textColor = .darkBlack
  }
  
  private let noShowCostCheckLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 24, weight: .bold)
    $0.textColor = .darkBlack
  }
  
  // MARK: - Con(De)structor
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}

// MARK: - SetupUI
private extension MyPageInfoHeader {
  func setupUI() {
    addSubviews(
      profileImageView,
      cameraIconImageView,
      userNameLabel,
      positionLabel,
      attendanceTitleLabel,
      absenseTitleLabel,
      noShowCostTitleLabel,
      attendanceCountLabel,
      absenseCountLabel,
      noShowCostCheckLabel
    )
    
    profileImageView.snp.makeConstraints {
      $0.top.equalToSuperview().inset(56)
      $0.centerX.equalToSuperview()
      $0.width.height.equalTo(96)
    }
    
    userNameLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(profileImageView.snp.bottom).offset(16)
    }
    
    positionLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(profileImageView.snp.bottom).offset(8)
    }
    
    absenseTitleLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(positionLabel.snp.bottom).offset(40)
    }
    
    absenseCountLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(absenseTitleLabel.snp.bottom).offset(12)
    }
    
    absenseTitleLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(positionLabel.snp.bottom).offset(40)
    }
    
    absenseCountLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(absenseTitleLabel.snp.bottom).offset(12)
    }
    
    attendanceTitleLabel.snp.makeConstraints {
      $0.centerX.equalTo(absenseTitleLabel).multipliedBy(0.5)
      $0.top.equalTo(positionLabel.snp.bottom).offset(40)
    }
    
    attendanceCountLabel.snp.makeConstraints {
      $0.centerX.equalTo(attendanceTitleLabel)
      $0.top.equalTo(absenseTitleLabel.snp.bottom).offset(12)
    }
  }
}
