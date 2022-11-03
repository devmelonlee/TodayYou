//
//  HowYouCollectionViewCell.swift
//  TodayYou
//
//  Created by 이승혁 on 2022/06/02.
//

import SnapKit
import UIKit

final class HowYouCollectionViewCell: UICollectionViewCell {
    private lazy var UserNoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        return label
    }()

    private lazy var ContentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)

        return label
    }()
  
  func setup() {
      
      //let themeColor = UIColor(red: 247/255, green: 199/255, blue: 198/255, alpha: 1.0)
    
      layer.cornerRadius = 12.0
      layer.shadowRadius = 2
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.1
      layer.shadowOffset = CGSize(width: 0, height: 5)
      backgroundColor = .systemBackground
      //layer.backgroundColor = themeColor.cgColor
    
   
    
    [UserNoLabel, ContentLabel].forEach { addSubview($0) }

    UserNoLabel.snp.makeConstraints {
        $0.leading.equalToSuperview().inset(16.0)
        $0.top.equalToSuperview().inset(16.0)
    }

    ContentLabel.snp.makeConstraints {
        $0.leading.equalTo(UserNoLabel)
        $0.top.equalTo(UserNoLabel.snp.bottom).offset(16.0)
        $0.bottom.equalToSuperview().inset(16.0)
    }

    UserNoLabel.text = "#00001"
    ContentLabel.text = "How are you "
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
