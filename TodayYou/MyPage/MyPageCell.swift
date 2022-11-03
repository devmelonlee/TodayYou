//
//  MyPageCell.swift
//  TodayYou
//
//  Created by 이승혁 on 2022/11/03.
//

import Foundation
import SnapKit
import UIKit

class MyPageCell: UICollectionViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!

  func setup() {
      layer.cornerRadius = 20
      layer.shadowRadius = 2
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.1
      layer.shadowOffset = CGSize(width: 0, height: 5)
      backgroundColor = .white // 배경


  }

  
}
