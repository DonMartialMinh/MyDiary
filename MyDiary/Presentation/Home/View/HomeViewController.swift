//
//  ViewController.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/10/22.
//

import UIKit
import Photos

class HomeViewController: BaseViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var picker: UIDatePicker!

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgoundTapped = UITapGestureRecognizer(target: self, action: #selector(self.backgroundTapped(_:)))
        backgroundImage.isUserInteractionEnabled = true
        backgroundImage.addGestureRecognizer(backgoundTapped)
    }

    // MARK: - ButtonClick
    @IBAction func dateClicked(_ sender: UIDatePicker) {
        print(sender.date)
    }

    @objc func backgroundTapped(_ sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "", message: "Cover photo", preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Choose from Camera Roll", style: .default , handler:{ (UIAlertAction) in
            self.chooseFromCamera()
        }))

        alert.addAction(UIAlertAction(title: "Choose from Diary", style: .default , handler:{ (UIAlertAction) in
        }))

        alert.addAction(UIAlertAction(title: "Delete", style: .default , handler:{ (UIAlertAction) in
            self.removeBackgroundImage()
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction) in
        }))

        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - Private
    private func chooseFromCamera() {
        PHPhotoLibrary.requestAuthorization { (status) in
            DispatchQueue.main.async {
                if status == .authorized{
                    let picker = UIImagePickerController()
                    picker.allowsEditing = false
                    picker.delegate = self.self
                    self.present(picker, animated: true, completion: nil)
                } else {
                    let ac = UIAlertController(title: "Enable photos access?", message: "To use this feature you must enable photos access in settings", preferredStyle: .alert)
                    let goToSettings = UIAlertAction(title: "Settings", style: .default) { (_) in
                        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString)  else {
                            return
                        }
                        if (UIApplication.shared.canOpenURL(settingsUrl)) {
                            UIApplication.shared.open(settingsUrl, completionHandler: nil)
                        }
                    }
                    ac.addAction(goToSettings)
                    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    self.present(ac, animated: true, completion: nil)
                }
            }
        }
    }

    private func removeBackgroundImage() {
        backgroundImage.image = nil
    }
}

// MARK: - ImagePickerDelegate
extension HomeViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        backgroundImage.image = nil
        backgroundImage.image = image
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension HomeViewController: UINavigationControllerDelegate {}
