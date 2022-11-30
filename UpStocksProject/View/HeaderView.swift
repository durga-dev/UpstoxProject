//
//  StockListView.swift
//  UpStocksProject
//
//  Created by Durga Ballabha Panigrahi on 29/11/22.
//

import Foundation
import UIKit

final class HeaderView: UIView {
    
    private let currentValueText = Views.label
    
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .purple
        subviews.forEach({ $0.removeFromSuperview() })
        
        addSubview(currentValueText)
        configureLabel()
        configureTitlelLabel(titleLabel:currentValueText)

    }
    
    private func configureLabel() {
        
        currentValueText.topAnchor.constraint(
            equalTo: topAnchor,
            constant: 0
        ).isActive = true
        
        currentValueText.leftAnchor.constraint(
            equalTo: leftAnchor,
            constant: 15
        ).isActive = true
        
        currentValueText.rightAnchor.constraint(
            equalTo: rightAnchor,
            constant: 0
        ).isActive = true
        
        currentValueText.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: 0
        ).isActive = true
    }
    
    
    private func configureTitlelLabel(titleLabel: UILabel) {
        
        titleLabel.text = "Upstox Holding"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 17.0, weight: .bold)

    }
    
    private enum Views {
        static var label: UILabel {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }
    }
}
