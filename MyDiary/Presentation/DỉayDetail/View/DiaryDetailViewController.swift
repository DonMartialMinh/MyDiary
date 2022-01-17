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

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    // MARK: - Private
    private func configure() {
        guard let data = data else { return }
        bar.topItem?.title = data.date.toString()
        let font = UIFont.systemFont(ofSize: 18.0)
        let attributedString = NSMutableAttributedString(string: data.content, attributes: [NSAttributedString.Key.font: font])
        if let image = data.image {
            let attachment = NSTextAttachment()
            attachment.image = image
            let oldWidth = attachment.image!.size.width;
            let scaleFactor = oldWidth / (content.frame.size.width);
            attachment.image = UIImage(cgImage: attachment.image!.cgImage!, scale: scaleFactor, orientation: .up)
            let imageString = NSAttributedString(attachment: attachment)
            attributedString.insert(imageString, at: attributedString.length)
        }
        content.attributedText = attributedString
        content.font = font
    }

    // MARK: - Button click
    @IBAction func cancelBarButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func editBarButton(_ sender: Any) {
        let vc = EditDiaryDetailViewController.initFromNib()
        vc.data = data
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
}
