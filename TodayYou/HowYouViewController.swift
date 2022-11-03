//
//  HowYouViewController.swift
//  TodayYou
//
//  Created by 이승혁 on 2022/06/02.
//

import SnapKit
import UIKit

class HowYouViewController: UIViewController {
  lazy var collectionView: UICollectionView = {
  let layout = UICollectionViewFlowLayout()
  layout.estimatedItemSize = CGSize(
      width: view.frame.width - 32.0,
      height: 100.0
  )
  layout.sectionInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
  layout.scrollDirection = .vertical

  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
  let themeColor = UIColor(red: 247/255, green: 199/255, blue: 198/255, alpha: 1.0)
    collectionView.backgroundColor = .systemBackground
  collectionView.register(HowYouCollectionViewCell.self, forCellWithReuseIdentifier: "HowYouCollectionViewCell")

  collectionView.dataSource = self

  //collectionView.refreshControl = refreshControl
  return collectionView
}()

override func viewDidLoad() {
super.viewDidLoad()

//self.title = "오늘의 할 일"

  view.addSubview(collectionView)
  collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
}


}

extension HowYouViewController: UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    1
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: "HowYouCollectionViewCell",
      for: indexPath
  ) as? HowYouCollectionViewCell
  cell?.setup()

  return cell ?? UICollectionViewCell() //nil일 때 return
}
}
