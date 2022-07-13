//
//  HistoryViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import UIKit

final class HistoryViewController: UIViewController {
    
    private var isDay = true
    private var datePickerMenu: UIMenu {
        return UIMenu(title: Texts.History.operationsBy, image: nil, identifier: nil, options: [], children: [
            UIAction(title: Texts.History.day, image: nil, handler: { [unowned self] _ in
                isDay = true
                tableView.reloadData()
            }),
            UIAction(title: Texts.History.week, image: nil, handler: { [unowned self] _ in
                isDay = false
                tableView.reloadData()
            }),
            UIAction(title: Texts.History.month, image: nil, handler: { [unowned self] _ in
                isDay = false
                tableView.reloadData()
            }),
            UIAction(title: Texts.History.year, image: nil, handler: { [unowned self] _ in
                isDay = false
                tableView.reloadData()
            })
        ])
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HistoryTableViewHeader.self, forHeaderFooterViewReuseIdentifier: HistoryTableViewHeader.identifier)
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 44
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Private methods
    @objc private func chooseFilter() {
        
    }
    
    @objc private func exportHistory() {
        
    }
    
    private func setupView() {
        view.backgroundColor = .systemGroupedBackground
        title = Texts.History.title
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Images.History.export, style: .plain, target: self, action: #selector(exportHistory))
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: nil, image: Images.History.timeline, primaryAction: nil, menu: datePickerMenu),
            UIBarButtonItem(image: Images.History.filter, style: .plain, target: self, action: #selector(chooseFilter))
        ]
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }
}

// MARK: - UITableView
extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        Int.random(in: 2...5)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Int.random(in: 1...10)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HistoryTableViewHeader.identifier) as? HistoryTableViewHeader
        else {
            fatalError("Could not create header for the table view in History in section \(section)")
        }
        header.configure()
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as? HistoryTableViewCell
        else {
            fatalError("Could not create cell for the table view in History at indexPath \(indexPath)")
        }
        cell.configure(isDay: isDay)
        return cell
    }
}
