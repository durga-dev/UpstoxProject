//
//  HomeViewController+UITableView.swift
//  UpStocksProject
//
//  Created by Durga Ballabha Panigrahi on 29/11/22.
//

import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return holdingData?.data?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let holdingData = holdingData?.data else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: StringConstant.stockListCell.rawValue,
            for: indexPath
        )
        let stockItemView = StockListView(
            data: holdingData[indexPath.row]
        )
        cell.contentView.subviews.forEach({ $0.removeFromSuperview() })
        cell.selectionStyle = .none
        stockItemView.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(stockItemView)
        configureStockListCell(stockItemView)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}
