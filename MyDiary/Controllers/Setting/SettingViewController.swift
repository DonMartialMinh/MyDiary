//
//  SettingViewController.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/11/22.
//

import UIKit

struct Section {
    let title: String
    let option: [SettingOptionType]
}

enum SettingOptionType {
    case defaultCell(option: SettingOption)
    case switchCell(option: SwitchSettingOption)
}

struct SwitchSettingOption {
    let title: String
    let isOn: Bool
    let handler: (() -> Void)
}

struct SettingOption {
    let title: String
    let handler: (() -> Void)
}

class SettingViewController: UIViewController {
    var sectionList = [Section]()

    // MARK: - IBOutlet
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        tableView.register(SwitchSettingTableViewCell.self, forCellReuseIdentifier: SwitchSettingTableViewCell.identifier)
        title = "Setting"
    }

    // MARK: - Button Click handle
    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Configure item
    func configure() {
        sectionList = [
            Section(title: "", option: [
                .defaultCell(option: SettingOption(title: "Account", handler: {
                    
                })),
                .defaultCell(option: SettingOption(title: "Remove Ads", handler: {
                    
                })),
                .defaultCell(option: SettingOption(title: "Remove Ads & Image backup", handler: {
                    
                }))
            ]),
            Section(title: "", option: [
                .defaultCell(option: SettingOption(title: "Appearance", handler: {
                    
                })),
                .defaultCell(option: SettingOption(title: "Dark Mode", handler: {
                    
                })),
                .defaultCell(option: SettingOption(title: "Reminder", handler: {
                    
                })),
                .switchCell(option: SwitchSettingOption(title: "Passcode", isOn: false, handler: {
                    
                })),
                .defaultCell(option: SettingOption(title: "Registration of Passcode", handler: {
                    
                }))
            ]),
            Section(title: "", option: [
                .defaultCell(option: SettingOption(title: "Help", handler: {
                    
                })),
                .defaultCell(option: SettingOption(title: "Term of use", handler: {
                    
                })),
                .defaultCell(option:SettingOption(title: "Contract", handler: {
                    
                })),
                .defaultCell(option: SettingOption(title: "WebSite", handler: {
                    
                })),
                .defaultCell(option: SettingOption(title: "Facebook", handler: {
                    
                }))
            ]),
            Section(title: "", option: [
                .defaultCell(option: SettingOption(title: "Recommend this app to a friend?", handler: {
                    
                })),
                .defaultCell(option: SettingOption(title: "Rate on App Store", handler: {
                    
                }))
                
            ])
        ]
    }
}

// MARK: - UITableViewDelegate
extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let option = sectionList[indexPath.section].option[indexPath.row]
        switch option {
        case .defaultCell(let option):
            option.handler()
        case .switchCell(let option):
            option.handler()
        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDatasource
extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 35
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        sectionList.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionList[section].option.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let option = sectionList[indexPath.section].option[indexPath.row]
        switch option {
        case .defaultCell(let option):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(With: option)
            return cell
        case .switchCell(let option):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchSettingTableViewCell.identifier, for: indexPath) as? SwitchSettingTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(With: option)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionList[section].title
    }
}
