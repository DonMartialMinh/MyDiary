//
//  EditDiaryDetailViewController.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/14/22.
//

import UIKit

class EditDiaryDetailViewController: UIViewController {
    var data: Diary?

    // MARK: - IBOutlet
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var navBar: UINavigationBar!

    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        configure()
    }

    @objc func keyboardWillShow(notification:NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)

        var contentInset:UIEdgeInsets = self.content.contentInset
        contentInset.bottom = keyboardFrame.size.height
        content.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        content.contentInset = contentInset
    }

    private func configure() {
        guard let data = data else { return }
        navBar.topItem?.title = data.date.toString()
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
        content.becomeFirstResponder()
    }

    // MARK: - Button clicked
    @IBAction func cameraButtonClicked(_ sender: UIBarButtonItem) {
    }

    @IBAction func cancelButtonClicked(_ sender: UIBarButtonItem) {
        content.resignFirstResponder()
        dismiss(animated: true, completion: nil)
    }
    
}
