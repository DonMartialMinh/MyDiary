//
//  ViewController.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/10/22.
//

import UIKit

class ViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var picker: UIDatePicker!

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgoundTapped = UITapGestureRecognizer(target: self, action: #selector(self.backgroundTapped(_:)))
        backgroundImage.isUserInteractionEnabled = true
        backgroundImage.addGestureRecognizer(backgoundTapped)
        // Do any additional setup after loading the view.
    }

    // MARK: - ButtonClick
    @IBAction func dateClicked(_ sender: UIDatePicker) {
        print(sender.date)
    }

    @objc func backgroundTapped(_ sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "", message: "Cover photo", preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Choose from Camera Roll", style: .default , handler:{ (UIAlertAction) in
        }))

        alert.addAction(UIAlertAction(title: "Choose from Diary", style: .default , handler:{ (UIAlertAction) in
        }))

        alert.addAction(UIAlertAction(title: "Delete", style: .default , handler:{ (UIAlertAction) in
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction) in
        }))

        self.present(alert, animated: true, completion: nil)
    }
}

