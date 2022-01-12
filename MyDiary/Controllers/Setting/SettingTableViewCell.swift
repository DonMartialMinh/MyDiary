//
//  SettingTableViewCell.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/11/22.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    static let identifier = "SettingCell"

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 15, y: 0, width: contentView.frame.size.width - 15, height: contentView.frame.size.height)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }

    public func configure( With data: SettingOption) {
        label.text = data.title
    }
}
