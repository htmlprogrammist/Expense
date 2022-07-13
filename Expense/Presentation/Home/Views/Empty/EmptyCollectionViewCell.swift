//
//  EmptyCollectionViewCell.swift
//  Expense
//
//  Created by Егор Бадмаев on 12.07.2022.
//

import UIKit

final class EmptyCollectionViewCell: UICollectionViewCell {
    
    private lazy var dashBorderLine: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.systemGray4.cgColor
        layer.fillColor = nil
        layer.lineWidth = 4
        layer.lineDashPattern = [12, 12]
        layer.frame = contentView.bounds
        layer.path = UIBezierPath(roundedRect: contentView.bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        return layer
    }()
    
    private let titleEmpty: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = Texts.Home.empty
        label.textColor = .tertiaryLabel
        return label
    }()
    
    private let tapToAddLabel: UILabel = {
        let label = UILabel()
        label.text = Texts.Home.tapToAdd
        label.textColor = .tertiaryLabel
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleEmpty, tapToAddLabel])
        stackView.alignment = .center
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = .emptyCellBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        
        contentView.addSubview(stackView)
//        contentView.layer.addSublayer(dashBorderLine)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
