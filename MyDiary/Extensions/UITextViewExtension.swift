//
//  UITextViewExtension.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/14/22.
//

import UIKit

extension UITextView {
    func scrollToBottom() {
        let textCount: Int = text.count
        guard textCount >= 1 else { return }
        scrollRangeToVisible(NSRange(location: textCount - 1, length: 1))
    }
}
