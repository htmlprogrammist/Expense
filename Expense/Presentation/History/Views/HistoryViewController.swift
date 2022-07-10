//
//  HistoryViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import UIKit

final class HistoryViewController: UIViewController {
    // MARK: - Views
    private lazy var filterButtonItem = UIBarButtonItem(image: Images.History.filter, style: .plain, target: self, action: #selector(chooseFilter))
    private lazy var highlightedFilterButtonItem = UIBarButtonItem(image: Images.History.filterHighlighted, style: .plain, target: self, action: #selector(chooseFilter))
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: [Texts.History.day, Texts.History.week, Texts.History.month, Texts.History.year])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlDidChange), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
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
    @objc private func chooseFilter(sender: UIBarButtonItem) {
        /*
         Вызывается не сразу, только после нажатия кнопки "Применить".
         При нажатии кнопки "Сброс" меняется на filterButtonItem
         */
        navigationItem.rightBarButtonItem = highlightedFilterButtonItem
    }
    
    @objc private func exportHistory() {
        
    }
    
    @objc private func addTransaction() {
        
    }
    
    @objc private func segmentedControlDidChange() {
        tableView.reloadData()
    }
    
    private func setupView() {
        // General
        view.backgroundColor = .systemGroupedBackground
        title = Texts.History.title
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTransaction))
        navigationItem.rightBarButtonItems = [
            filterButtonItem,
            UIBarButtonItem(image: Images.History.export, style: .plain, target: self, action: #selector(exportHistory))
        ]
        
        // Adding and setuping subviews
        view.addSubview(segmentedControl)
        view.addSubview(tableView)
        
        // Activating constraints
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }
}

// MARK: - UITableView
extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        // чисто по приколу сделал, по факту надо будет из вьюмодели тягать количество секций
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return 7
        case 1:
            return 5
        case 2:
            return 3
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // чисто по приколу сделал, по факту надо будет из вьюмодели тягать количество транзакций
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return Int.random(in: 1...2)
        case 1:
            return Int.random(in: 1...4)
        case 2:
            return Int.random(in: 1...6)
        default:
            return Int.random(in: 1...8)
        }
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
        cell.configure(isDay: segmentedControl.selectedSegmentIndex == 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if segmentedControl.selectedSegmentIndex > 0 {
            // TODO: Реализовать открытие модуля с транзакциями за выбранный период
        } else {
            // TODO: Реализовать открытие модуля с деталями по транзакциями ("Изменить")
        }
    }
}
