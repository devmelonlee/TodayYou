//
//  DiaryDetailViewController.swift
//  TodayYou
//
//  Created by 이승혁 on 2022/06/01.
//

import UIKit

class DiaryDetailViewController: UIViewController {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var contentsTextView: UITextView!
  @IBOutlet weak var dateLabel: UILabel!
  
  
  var diary: Diary?
  var indexPath: IndexPath?
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()
    /*NotificationCenter.default.addObserver(
      self,
      selector: #selector(starDiaryNotification(_:)),
      name: NSNotification.Name("starDiary"),
      object: nil
    )*/
  }
  
  private func configureView() {
    guard let diary = self.diary else { return }
    self.titleLabel.text = diary.title
    self.contentsTextView.text = diary.contents
    self.dateLabel.text = self.dateToString(date: diary.date)
    /*self.starButton = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(tapStarButton))
    self.starButton?.image = diary.isStar ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
    self.starButton?.tintColor = .orange
    self.navigationItem.rightBarButtonItem = self.starButton */
  }

  private func dateToString(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
    formatter.locale = Locale(identifier: "ko_KR")
    return formatter.string(from: date)
  }

  @objc func editDiaryNotification(_ notification: Notification) {
    guard let diary = notification.object as? Diary else { return }
    self.diary = diary
    self.configureView()
  }
  /*
  @objc func starDiaryNotification(_ notification: Notification) {
    guard let starDiary = notification.object as? [String: Any] else { return }
    guard let isStar = starDiary["isStar"] as? Bool else { return }
    guard let uuidString = starDiary["uuidString"] as? String else { return }
    guard let diary = self.diary else { return }
    if diary.uuidString == uuidString {
      self.diary?.isStar = isStar
      self.configureView()
    }
  }*/
  @IBAction func tapEditButton(_ sender: UIButton) {
    guard let DiaryViewController = self.storyboard?.instantiateViewController(identifier: "WriteDiaryViewController") as? WriteDiaryViewController else { return }
    guard let indexPath = self.indexPath else { return }
    guard let diary = self.diary else { return }
    DiaryViewController.diaryEditorMode = .edit(indexPath, diary)
    NotificationCenter.default.addObserver( // 이벤트 발생시
      self,
      selector: #selector(editDiaryNotification(_:)),
      name: NSNotification.Name("editDiary"),
      object: nil
    )
    self.navigationController?.pushViewController(DiaryViewController, animated: true)
  }
  
  @IBAction func tapDeleteButton(_ sender: UIButton) {
    guard let uuidString = self.diary?.uuidString else { return }
    NotificationCenter.default.post(
      name: NSNotification.Name("deleteDiary"),
      object: uuidString,
      userInfo: nil
    )
    self.navigationController?.popViewController(animated: true)
  }
  /*
  @objc func tapStarButton() {
    guard let isStar = self.diary?.isStar else { return }

    if isStar {
      self.starButton?.image = UIImage(systemName: "star")
    } else {
      self.starButton?.image = UIImage(systemName: "star.fill")
    }
    self.diary?.isStar = !isStar
    NotificationCenter.default.post(
      name: NSNotification.Name("starDiary"),
      object: [
        "diary": self.diary,
        "isStar": self.diary?.isStar ?? false,
        "uuidString": diary?.uuidString
      ],
      userInfo: nil
    )
  }*/

  deinit {
    NotificationCenter.default.removeObserver(self)
  }

}
