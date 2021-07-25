//
//  MyPageLinkTitleHeader.swift
//  DDD.Attendance
//
//  Created by 황재욱 on 2021/07/14.
//  Copyright © 2021 DDD. All rights reserved.
//

import UIKit

class MyPageLinkTitleHeader: UICollectionReusableView {
  
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 18, weight: .bold)
    $0.text = "소식정보 링크"
  }
}

// MARK: - SetupUI
private extension MyPageLinkTitleHeader {
  func setupUI() {
    addSubview(titleLabel)
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().inset(40)
      $0.leading.equalToSuperview().inset(28)
    }
  }
}
