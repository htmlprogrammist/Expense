//
//  HistoryViewController.swift
//  Expense
//
//  Created by Егор Бадмаев on 25.06.2022.
//

import UIKit

final class HistoryViewController: UIViewController {
    
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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let addTransactionButton = UIButton(title: "Add", image: Images.add, backgroundColor: UIColor(named: "AccentColor") ?? .white, cornerRadius: 22, shadows: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
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
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let translation = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        if translation.y > 0 {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.64, initialSpringVelocity: 0.2, options: .allowUserInteraction, animations: { [unowned self] in
                addTransactionButton.transform = CGAffineTransform.identity
            })
        } else {
            UIView.animate(withDuration: 1, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .allowUserInteraction, animations: { [unowned self] in
                addTransactionButton.transform = CGAffineTransform(translationX: 1, y: 100)
            })
        }
    }
}

// MARK: - Helper methods
private extension HistoryViewController {
    func setupView() {
        // General
        view.backgroundColor = .systemGroupedBackground
        title = Texts.History.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Images.filter, style: .plain, target: self, action: #selector(chooseFilter))
        
        // Adding and setuping subviews
        view.addSubview(segmentedControl)
        view.addSubview(tableView)
        view.addSubview(addTransactionButton)
        addTransactionButton.addTarget(self, action: #selector(addTransaction), for: .touchUpInside)
        
        // Activating constraints
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            addTransactionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 36),
            addTransactionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -36),
            addTransactionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            addTransactionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    @objc func chooseFilter() {
        
    }
    
    @objc func addTransaction(sender: UIButton) {
        
        
        /// **Button's animation**, it shrinks a bit and then becomes `identity`
        sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.975)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .allowUserInteraction, animations: {
            sender.transform = CGAffineTransform.identity
        })
    }
    
    @objc func segmentedControlDidChange() {
        tableView.reloadData()
    }
}
