//
//  DiaryDetailViewController.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/12/22.
//

import UIKit

class DiaryDetailViewController: UIViewController {
    var data: Diary?

    // MARK: - IBOutlet
    @IBOutlet weak var bar: UINavigationBar!
    @IBOutlet weak var content: UITextView!

    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        content.text = data?.content
        bar.topItem?.title = data?.date.toString()
    }

    // MARK: - Button click
    @IBAction func cancelBarButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func editBarButton(_ sender: Any) {
    }
}
