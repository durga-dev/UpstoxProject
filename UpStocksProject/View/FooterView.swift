//
//  StockListView.swift
//  UpStocksProject
//
//  Created by Durga Ballabha Panigrahi on 29/11/22.
//

import Foundation
import UIKit

final class FooterView: UIView {
    
    private let verticalStackView = Views.verticalStackView
    private let horizontalStackViewOne = Views.horizontalStackView
    private let horizontalStackViewTwo = Views.horizontalStackView
    private let horizontalStackViewThree = Views.horizontalStackView
    private let horizontalStackViewFour = Views.horizontalStackView
    private let horizontalStackViewFive = Views.horizontalStackView

    private let currentValueText = Views.label
    private let currentValue = Views.label
    private let TotalInvestmentLabel = Views.label
    private let TotalInvestmentValue = Views.label
    
    private let TodayProfitText = Views.label
    private let TodayProfitValue = Views.label
    private let ProfitLossLabel = Views.label
    private let ProfitLossValue = Views.label
    
    public var holdingData: UpStockHoldingMapperProtocol?{
        didSet{
            guard let holdingData = holdingData else {
                return
            }
            setupData(holdingData:holdingData)
        }
    }
    
    init(){
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
            horizontalStackViewTwo,
            horizontalStackViewThree,
            horizontalStackViewFour,
            horizontalStackViewFive
        ].forEach { stackView in
            verticalStackView.addArrangedSubview(stackView)
        }
        
        horizontalStackViewOne.subviews.forEach({ $0.removeFromSuperview() })
        horizontalStackViewTwo.subviews.forEach({ $0.removeFromSuperview() })
        
        configureVerticalStackView()

        [
            currentValueText,
            currentValue
        ].forEach { label in
            horizontalStackViewOne.addArrangedSubview(label)
        }
        
        configureTitlelLabel(titleLabel:currentValueText, titleText: "Current Value:")
        
        
        [
            TotalInvestmentLabel,
            TotalInvestmentValue
        ].forEach { label in
            horizontalStackViewTwo.addArrangedSubview(label)
        }
        
        configureTitlelLabel(titleLabel:TotalInvestmentLabel, titleText: "Total Investment:")
       
        
        [
            TodayProfitText,
            TodayProfitValue
        ].forEach { label in
            horizontalStackViewThree.addArrangedSubview(label)
        }
        
        configureTitlelLabel(titleLabel:TodayProfitText, titleText: "Today's Profit & Loss:")
       
        
        [
            ProfitLossLabel,
            ProfitLossValue
        ].forEach { label in
            horizontalStackViewFive.addArrangedSubview(label)
        }
        
        configureTitlelLabel(titleLabel:ProfitLossLabel, titleText: "Profit & Loss:")
        


    }
    
    private func setupData(holdingData:UpStockHoldingMapperProtocol){
        configureValueLabel(valueLabel: currentValue, valueText: "₹\(String(holdingData.currentValue))")
        configureValueLabel(valueLabel: TotalInvestmentValue, valueText: "₹\(String(holdingData.totalInvestment))")
        configureValueLabel(valueLabel: TodayProfitValue, valueText: "₹\(String(holdingData.todayProfitLoss))")
        configureValueLabel(valueLabel: ProfitLossValue, valueText: "₹\(String(holdingData.totalProfitLoss))")
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
    
    private func configureTitlelLabel(titleLabel: UILabel, titleText: String) {
        
        titleLabel.text = titleText
        titleLabel.font = .systemFont(ofSize: 17.0, weight: .bold)

    }
    
    private func configureValueLabel(valueLabel: UILabel, valueText: String) {
        valueLabel.textAlignment = .right
        valueLabel.text = valueText
        valueLabel.font = .systemFont(ofSize: 17.0, weight: .regular)

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
