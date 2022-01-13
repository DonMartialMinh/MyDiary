//
//  UITableViewCellExtension.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/13/22.
//

import UIKit

extension UITableViewCell {
    static var classId: String {
        autoreleasepool {
            return String(describing: Self.self)
        }
    }

    static func initFromNib() -> UINib {
        return UINib(nibName: classId, bundle: nil)
    }
}
