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

    private func setUpNavigationController() {
        navigationItem.title = "My Diary";
        //create bar button item
        let gearImage = UIImage(systemName: "gearshape.fill")
        let gearButton = UIBarButtonItem(image: gearImage, style: .plain, target: self, action: #selector(leftButtonClicked(_:)))
        navigationItem.leftBarButtonItem = gearButton
        
        let searchImage = UIImage(systemName: "magnifyingglass")
        let searchButton = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(searchButtonClicked(_:)))
        
        
        let rightButtonImage = UIImage(systemName: "list.dash.header.rectangle")
        let rightButton = UIBarButtonItem(image: rightButtonImage, style: .plain, target: self, action: #selector(rightButtonClicked(_:)))
        
        navigationItem.rightBarButtonItems = [rightButton, searchButton]
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
    
    @objc func rightButtonClicked(_ sender: UIBarButtonItem) {
        print("123")
    }
}
