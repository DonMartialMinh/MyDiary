//
//  DiaryListViewController.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/12/22.
//

import UIKit

struct DiarySection {
    let title: String
    let diaryList: [Diary]
}
aaaa
struct Diary {
    let date: Date
    let content: String
    let image: UIImage?
}

class DiaryListViewController: BaseViewController {
    var sections = [DiarySection]()

    // MARK: - IBOutlet
    @IBOutlet weak var table: UITableView!

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        table.delegate = self
        table.dataSource = self
        table.register(DiaryTableViewCell.initFromNib(), forCellReuseIdentifier: DiaryTableViewCell.identifier)
    }

    // MARK: - Override
    override func setUpNavigationController() {
        super.setUpNavigationController()
        navigationItem.rightBarButtonItems?.removeFirst()
        let calendarButtonImage = UIImage(systemName: "calendar")
        let calendarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        calendarButton.setImage(calendarButtonImage, for: .normal)
        calendarButton.addTarget(self, action: #selector(calendarButtonClicked(_:)), for: .touchUpInside)
        let calendarBarButton = UIBarButtonItem(customView: calendarButton)
        navigationItem.rightBarButtonItems?.insert(calendarBarButton, at: 0)
    }

    // MARK: - Button clicked
    @objc func calendarButtonClicked(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: false)
    }

    // MARK: - Private
    private func configure() {
        sections = [
            DiarySection(title: "2022.01", diaryList: [
                Diary(date: Date(), content: "Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một ", image: nil)
            ]),
            DiarySection(title: "2021.12", diaryList: [
                Diary(date: Date(), content: "Mộ", image: UIImage(named: "Me")),
                Diary(date: Date(), content: "Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một nMột Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một Một", image: UIImage(named: "Bgay"))
            ]),
        ]
    }
}

// MARK: - UITableViewDataSource
extension DiaryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].diaryList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let diary = sections[indexPath.section].diaryList[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiaryTableViewCell.identifier, for: indexPath) as? DiaryTableViewCell else {
            return UITableViewCell()
        }
        cell.data = diary
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}

// MARK: - UITableViewDelegate
extension DiaryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = DiaryDetailViewController.initFromNib()
        vc.data = sections[indexPath.section].diaryList[indexPath.row]
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textAlignment = .center
            headerView.textLabel?.textColor = .black
        }
    }
}
