//
//  MyPageLinkInfoCell.swift
//  DDD.Attendance
//
//  Created by 황재욱 on 2021/07/14.
//  Copyright © 2021 DDD. All rights reserved.
//

import UIKit

class MyPageLinkInfoCell: UICollectionViewCell {
  
  // MARK: - UI Components
  
  private let cardView = UIView().then {
    $0.backgroundColor = .white
  }
  
  private let imageView = UIImageView()
  
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = .softGray
  }
  
  private let descriptionLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .medium)
    $0.textColor = .black
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - SetupUI
private extension MyPageLinkInfoCell {
  private func setupUI() {
    contentView.addSubview(cardView)
    cardView.addSubviews(
      imageView,
      titleLabel,
      descriptionLabel
    )
    
    cardView.snp.makeConstraints {
      $0.top.bottom.equalToSuperview().inset(8)
      $0.leading.trailing.equalToSuperview().inset(28)
    }
    
    imageView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().inset(16)
      $0.width.height.equalTo(42)
    }
  }
}

