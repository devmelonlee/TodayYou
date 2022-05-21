//
//  RoundCornerButton.swift
//  TodayYou
//
//  Created by 이승혁 on 2022/05/22.
//

import UIKit

@IBDesignable //실시간 반영
class RoundCornerButton: UIButton {
  @IBInspectable var isRound: Bool = false {
    didSet {
      if isRound {
        self.layer.cornerRadius = 15
        //self.layer.shadowRadius = 10 //그림자
      }
    }
  }
}
