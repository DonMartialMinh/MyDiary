//
//  File.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/10/22.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
    }

    // MARK: - Setup
    func setUpNavigationController() {
        navigationItem.title = "My Diary";
        //create bar button item
        let gearImage = UIImage(systemName: "gearshape.fill")
        let gearButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        gearButton.setImage(gearImage, for: .normal)
        gearButton.addTarget(self, action: #selector(leftButtonClicked(_:)), for: .touchUpInside)
        let gearBarButton = UIBarButtonItem(customView: gearButton)
        navigationItem.leftBarButtonItem = gearBarButton

        let searchImage = UIImage(systemName: "magnifyingglass")
        let searchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        searchButton.setImage(searchImage, for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonClicked(_:)), for: .touchUpInside)
        let searchbarButton = UIBarButtonItem(customView: searchButton)

        let diaryListButtonImage = UIImage(systemName: "list.dash.header.rectangle")
        let diaryListButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        diaryListButton.setImage(diaryListButtonImage, for: .normal)
        diaryListButton.addTarget(self, action: #selector(diaryListButtonClicked(_:)), for: .touchUpInside)
        let diaryListbarButton = UIBarButtonItem(customView: diaryListButton)

        navigationItem.rightBarButtonItems = [diaryListbarButton, searchbarButton]
    }

    // MARK: - ButtonClicked
    @objc func leftButtonClicked(_ sender: UIBarButtonItem) {
        let vc = SettingViewController.initFromNib()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    @objc func searchButtonClicked(_ sender: UIBarButtonItem) {
        print("123")
    }

    @objc func diaryListButtonClicked(_ sender: UIBarButtonItem) {
        let vc = DiaryListViewController.initFromNib()
        navigationController?.pushViewController(vc, animated: false)
    }
}
