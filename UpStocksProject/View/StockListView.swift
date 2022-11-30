//
//  StockListView.swift
//  UpStocksProject
//
//  Created by Durga Ballabha Panigrahi on 29/11/22.
//

import Foundation
import UIKit

final class StockListView: UIView {
    private var holdingData: ClientData
    private let verticalStackView = Views.verticalStackView
    private let horizontalStackViewOne = Views.horizontalStackView
    private let horizontalStackViewTwo = Views.horizontalStackView
    
    private let symbolLabel = Views.label
    private let ltpLabel = Views.label
    private let quantityLabel = Views.label
    private let pnlLabel = Views.label
    
    init(
        data: ClientData
    ) {
        holdingData = data
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        subviews.forEach({ $0.removeFromSuperview() })
        
        addSubview(verticalStackView)
        verticalStackView.subviews.forEach({ $0.removeFromSuperview() })
        [
            horizontalStackViewOne,
            horizontalStackViewTwo
        ].forEach { stackView in
            verticalStackView.addArrangedSubview(stackView)
        }
        
        horizontalStackViewOne.subviews.forEach({ $0.removeFromSuperview() })
        horizontalStackViewTwo.subviews.forEach({ $0.removeFromSuperview() })
        
        configureVerticalStackView()
        
        [
            symbolLabel,
            ltpLabel
        ].forEach { label in
            horizontalStackViewOne.addArrangedSubview(label)
        }
        
        configureSymbolLabel()
        configureLtpLabel()
        
        [
            quantityLabel,
            pnlLabel
        ].forEach { label in
            horizontalStackViewTwo.addArrangedSubview(label)
        }
        
        configureQuantitylLabel()
        configurePNLLabel()
        
        
    }
    
    private func configureVerticalStackView() {
        
        verticalStackView.topAnchor.constraint(
            equalTo: topAnchor,
            constant: 4
        ).isActive = true
        
        verticalStackView.leftAnchor.constraint(
            equalTo: leftAnchor,
            constant: 8
        ).isActive = true
        
        verticalStackView.rightAnchor.constraint(
            equalTo: rightAnchor,
            constant: -8
        ).isActive = true
        
        verticalStackView.bottomAnchor.constraint(
            equalTo: bottomAnchor,
            constant: 4
        ).isActive = true
    }
    
    private func configureSymbolLabel() {
        
        symbolLabel.text = holdingData.symbol
        symbolLabel.font = .systemFont(ofSize: 17.0, weight: .bold)
        
    }
    
    private func configureLtpLabel() {
        ltpLabel.textAlignment = .right
        ltpLabel.attributedText =
        NSMutableAttributedString()
            .normal("LTP: ")
            .bold("₹\(String(format: "%.2f",holdingData.ltp))")
        
    }
    
    private func configureQuantitylLabel() {
        
        quantityLabel.text = String(holdingData.quantity)
        quantityLabel.font = .systemFont(ofSize: 17.0, weight: .regular)
        
    }
    
    private func configurePNLLabel() {
        pnlLabel.textAlignment = .right
        pnlLabel.attributedText =
        NSMutableAttributedString()
            .normal("P/L: ")
            .bold("₹\(String(format: "%.2f",holdingData.profitLoss()))")
    }
    
    private enum Views {
        static var verticalStackView: UIStackView {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            return stackView
        }
        
        static var horizontalStackView: UIStackView {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            return stackView
        }
        
        static var label: UILabel {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }
    }
}

extension NSMutableAttributedString {
    var fontSize:CGFloat {
        return 14
        
    }
    var boldFont:UIFont {
        return UIFont.boldSystemFont(ofSize: fontSize)
        
    }
    var normalFont:UIFont {
        return UIFont.systemFont(ofSize: fontSize)
    }
    
    func bold(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func normal(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
}
