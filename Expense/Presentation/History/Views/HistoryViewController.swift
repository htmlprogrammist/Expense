//
//  HistoryViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import UIKit

final class HistoryViewController: UITableViewController {
    // MARK: - Views
    private lazy var filterButtonItem = UIBarButtonItem(image: Images.History.filter, style: .plain, target: self, action: #selector(chooseFilter))
    private lazy var highlightedFilterButtonItem = UIBarButtonItem(image: Images.History.filterHighlighted, style: .plain, target: self, action: #selector(chooseFilter))
    
    private lazy var segmentedControlBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        view.addSubview(segmentedControl)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: [Texts.History.day, Texts.History.week, Texts.History.month, Texts.History.year])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlDidChange), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.bringSubviewToFront(segmentedControlBackground)
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
        view.backgroundColor = .systemGroupedBackground
        title = Texts.History.title
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTransaction))
        navigationItem.rightBarButtonItems = [
            filterButtonItem,
            UIBarButtonItem(image: Images.History.export, style: .plain, target: self, action: #selector(exportHistory))
        ]
        
//        view.addSubview(tableView)
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HistoryTableViewHeader.self, forHeaderFooterViewReuseIdentifier: HistoryTableViewHeader.identifier)
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 44
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: HistoryTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.contentInset = UIEdgeInsets(top: 32, left: 0, bottom: 16, right: 0)
        
        view.addSubview(segmentedControlBackground)
        NSLayoutConstraint.activate([
            segmentedControlBackground.heightAnchor.constraint(equalTo: segmentedControl.heightAnchor),
            segmentedControlBackground.widthAnchor.constraint(equalTo: segmentedControl.widthAnchor)
//            segmentedControl.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
//            segmentedControl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
//            segmentedControl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
        ])
    }
}

// MARK: - UITableView
extension HistoryViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HistoryTableViewHeader.identifier) as? HistoryTableViewHeader
        else {
            fatalError("Could not create header for the table view in History in section \(section)")
        }
        header.configure()
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as? HistoryTableViewCell
        else {
            fatalError("Could not create cell for the table view in History at indexPath \(indexPath)")
        }
        cell.configure(isDay: segmentedControl.selectedSegmentIndex == 0)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if segmentedControl.selectedSegmentIndex == 0 {
            // TODO: Реализовать открытие модуля с деталями по транзакциями ("Изменить")
        } else {
            // TODO: Реализовать открытие модуля с транзакциями за выбранный период
        }
    }
}
