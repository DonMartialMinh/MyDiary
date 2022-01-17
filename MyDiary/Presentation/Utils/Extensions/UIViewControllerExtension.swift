//
//  UIViewControllerExtension.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/11/22.
//

import UIKit

extension UIViewController {
    static var classId: String {
        autoreleasepool {
            return String(describing: Self.self)
        }
    }

    static func initFromNib() -> Self {
        return Self(nibName: classId, bundle: nil)
    }
}
