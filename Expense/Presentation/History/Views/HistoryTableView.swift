//
//  HistoryTableView.swift
//  Expense
//
//  Created by Егор Бадмаев on 29.06.2022.
//

import UIKit

final class HistoryTableViewCell: UITableViewCell {
    
    static let identifier = "HistoryTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(isDay: Bool) {
        
        
        // TODO: Если segmentedIndex (или как там) == 0, то 1. стрелка не появляется и 2. пишется время (чч:мм)
        if isDay {
            
        } else {
            // пока что получилось не очень, но, я думаю, эта проблема исчезнет, когда будет полноценная загрузка данных
            accessoryType = .disclosureIndicator
        }
    }
    
    private func commonInit() {
        
    }
}
