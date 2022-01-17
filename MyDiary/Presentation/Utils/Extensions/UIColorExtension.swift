//
//  UIColorExtension.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/14/22.
//

import UIKit

enum AssetsColor {
    case purple
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .purple:
            return UIColor(named: "purple")
        }
    }
}
