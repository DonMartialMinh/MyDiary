//
//  DiaryTableViewCell.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/12/22.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    static let identifier = "DiaryCell"
    var data: Diary? {
        didSet {
            dayLabel.text = "\(data!.date.get(.day))"
            weekDayLabel.text = data!.date.getWeekDay()
            contentLabel.text = data!.content
            if data!.image == nil {
                backgroundContentImage.isHidden = true
                contentImage.isHidden = true
            } else {
                contentImage.image = data!.image
            }
        }
    }

    // MARK: - IBOutlet
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weekDayLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var backgroundContentImage: UIView!
    @IBOutlet weak var contentImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        contentLabel.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
