//
//  ToDoCollectionViewCell.swift
//  TodayYou
//
//  Created by 이승혁 on 2022/06/01.
//

import SnapKit
import UIKit

final class ToDoCollectionViewCell: UICollectionViewCell {
    private lazy var lineLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)

        return label
    }()

    private lazy var remainTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)

        return label
    }()
  
  func setup() {
      layer.cornerRadius = 12.0
      
      layer.shadowRadius = 2
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.1
      layer.shadowOffset = CGSize(width: 0, height: 5)
      

      backgroundColor = .systemBackground

  }

    /*func setup(with realTimeArrival: StationArrivalDatResponseModel.RealTimeArrival) {

        [lineLabel, remainTimeLabel].forEach { addSubview($0) }

        lineLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16.0)
            $0.top.equalToSuperview().inset(16.0)
        }

        remainTimeLabel.snp.makeConstraints {
            $0.leading.equalTo(lineLabel)
            $0.top.equalTo(lineLabel.snp.bottom).offset(16.0)
            $0.bottom.equalToSuperview().inset(16.0)
        }

        lineLabel.text = realTimeArrival.line
        remainTimeLabel.text = realTimeArrival.remainTime
    }*/
}
