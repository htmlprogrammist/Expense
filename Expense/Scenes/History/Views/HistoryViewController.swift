//
//  HistoryViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import UIKit

protocol HistoryViewProtocol: AnyObject {
}

final class HistoryViewController: UIViewController {
    
    private let presenter: HistoryPresenterProtocol
    private var isDay = true
    
    private var datePickerMenu: UIMenu {
        return UIMenu(title: Texts.History.operationsBy, image: nil, identifier: nil, options: [], children: [
            UIAction(title: Texts.History.day, image: nil, handler: { [unowned self] _ in
                handleAction(by: .day)
            }),
            UIAction(title: Texts.History.week, image: nil, handler: { [unowned self] _ in
                handleAction(by: .week)
            }),
            UIAction(title: Texts.History.month, image: nil, handler: { [unowned self] _ in
                handleAction(by: .month)
            }),
            UIAction(title: Texts.History.year, image: nil, handler: { [unowned self] _ in
                handleAction(by: .year)
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
    
    init(presenter: HistoryPresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    private func handleAction(by period: Period) {
        isDay = period == .day
        presenter.provideData(by: period)
        tableView.reloadData()
    }
    
    /// Opens action sheet of `UIAlertController` with choosing period like in the `datePickerMenu: UIMenu`
    @objc private func choosePeriod() {
        let alertController = UIAlertController(title: Texts.History.operationsBy, message: Texts.History.operationsByDescription, preferredStyle: .actionSheet)
        let day = UIAlertAction(title: Texts.History.day, style: .default, handler: { [unowned self] _ in
            handleAction(by: .day)
        })
        let week = UIAlertAction(title: Texts.History.week, style: .default, handler: { [unowned self] _ in
            handleAction(by: .week)
        })
        let month = UIAlertAction(title: Texts.History.month, style: .default, handler: { [unowned self] _ in
            handleAction(by: .month)
        })
        let year = UIAlertAction(title: Texts.History.year, style: .default, handler: { [unowned self] _ in
            handleAction(by: .year)
        })
        let cancel = UIAlertAction(title: Texts.History.cancel, style: .cancel)
        
        [day, week, month, year, cancel].forEach {
            alertController.addAction($0)
        }
        /// for definition try to open declaration of this functions in Extensions/UIKit/UIAlertController.swift
        alertController.negativeWidthConstraint()
        present(alertController, animated: true)
    }
    
    private func setupView() {
        view.backgroundColor = .systemGroupedBackground
        title = Texts.History.title
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Images.History.export, style: .plain, target: self, action: #selector(exportHistory))
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: Images.History.filter, style: .plain, target: self, action: #selector(chooseFilter))
        ]
        
        if #available(iOS 14.0, *) {
            navigationItem.rightBarButtonItems?.insert(
                UIBarButtonItem(title: nil, image: Images.History.timeline, primaryAction: nil, menu: datePickerMenu), at: 0)
        } else {
            navigationItem.rightBarButtonItems?.insert(
                UIBarButtonItem(image: Images.History.timeline, style: .plain, target: self, action: #selector(choosePeriod)), at: 0)
        }
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }
}

extension HistoryViewController: HistoryViewProtocol {
}

// MARK: - TableView
extension HistoryViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        Int.random(in: 2...5)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Int.random(in: 1...10)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as? HistoryTableViewCell
        else {
            fatalError("Could not create cell for the table view in History at indexPath \(indexPath)")
        }
        cell.configure(isDay: isDay)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if isDay {
            
        } else {
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HistoryTableViewHeader.identifier) as? HistoryTableViewHeader
        else {
            fatalError("Could not create header for the table view in History in section \(section)")
        }
        // TODO: ViewModel должна возвращать attributed string для чисел и рубля - они должны быть чуть жирнее, чем текст
        header.configure(date: Tagged("6-12 июня 2022 г."),
                         income: "Доход: \(Int.random(in: 1000...10000)) ₽".toAttributedString(after: ":", ofSize: 14, with: .semibold),
                         expense: "Расход: \(Int.random(in: 1000...10000)) ₽".toAttributedString(after: ":", ofSize: 14, with: .semibold))
        return header
    }
}
