//
//  UINavigationBarExtension.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/14/22.
//

import UIKit

extension UINavigationBar {
    func update(backgroundColor: UIColor? = nil, titleColor: UIColor? = nil) {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
              appearance.configureWithOpaqueBackground()
              if let backgroundColor = backgroundColor {
                appearance.backgroundColor = backgroundColor
              }
              if let titleColor = titleColor {
                appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
              }
              standardAppearance = appearance
              scrollEdgeAppearance = appearance
        } else {
              if let backgroundColor = backgroundColor {
                barTintColor = backgroundColor
              }
              if let titleColor = titleColor {
                titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
              }
        }
    }
}
