//
//  ToDoViewController.swift
//  TodayYou
//
//  Created by 이승혁 on 2022/06/01.
//

import SnapKit
import UIKit
class ToDoViewController: UIViewController {
      lazy var collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      layout.estimatedItemSize = CGSize(
          width: view.frame.width - 32.0,
          height: 100.0
      )
      layout.sectionInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
      layout.scrollDirection = .vertical

      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      collectionView.backgroundColor = .systemBackground
      collectionView.register(ToDoCollectionViewCell.self, forCellWithReuseIdentifier: "ToDoCollectionViewCell")

      collectionView.dataSource = self

      //collectionView.refreshControl = refreshControl
      return collectionView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    self.title = "오늘의 할 일"

      view.addSubview(collectionView)
      collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
  }

  
}

extension ToDoViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 20
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(
          withReuseIdentifier: "ToDoCollectionViewCell",
          for: indexPath
      ) as? ToDoCollectionViewCell
      cell?.setup()

      return cell ?? UICollectionViewCell() //nil일 때 return
  }
}
