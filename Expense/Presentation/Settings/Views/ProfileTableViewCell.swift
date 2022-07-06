//
//  ProfileTableViewHeader.swift
//  Expense
//
//  Created by Егор Бадмаев on 04.07.2022.
//

import UIKit

final class ProfileTableViewCell: UITableViewCell {
    
    // UIView with gray background
    // UILabel with emoji inside UIView
    
    // UILabel with name of the wallet
    // UILabel subtitle with `Texts.Settings.managingWallets`
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        accessoryType = .disclosureIndicator
        
        
    }
}
