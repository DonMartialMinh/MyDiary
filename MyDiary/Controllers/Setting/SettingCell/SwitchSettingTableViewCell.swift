//
//  SwitchSettingTableViewCell.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/11/22.
//

import UIKit

class SwitchSettingTableViewCell: UITableViewCell {
    static let identifier = "SwitchSettingCell"

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.backgroundColor = .systemGray
        mySwitch.layer.cornerRadius = 16
        return mySwitch
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(mySwitch)
        contentView.clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(
            x: 15,
            y: 0,
            width: contentView.frame.size.width - 15,
            height: contentView.frame.size.height
        )
        mySwitch.sizeToFit()
        mySwitch.frame = CGRect(
            x: (contentView.frame.size.width - mySwitch.frame.size.width - 15),
            y: (contentView.frame.size.height - mySwitch.frame.size.height)/2,
            width: mySwitch.frame.size.width,
            height: mySwitch.frame.size.height
        )
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
        mySwitch.isOn = false
    }

    public func configure( With data: SwitchSettingOption) {
        label.text = data.title
        mySwitch.isOn = data.isOn
    }
}

