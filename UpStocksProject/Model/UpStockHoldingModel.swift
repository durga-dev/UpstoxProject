//
//  UpStockHoldingModel.swift
//  UpStocksProject
//
//  Created by Durga Ballabha Panigrahi on 29/11/22.
//

import Foundation

public protocol UpStockHoldingResponseModelProtocol {
    var clientID: String? { get }
    var data: [ClientData]? { get }
    var responseType: String? { get }
    var timestamp: Int? { get }
}

public struct UpStockHoldingResponseModel: Codable, UpStockHoldingResponseModelProtocol {
    public var clientID: String?
    public var data: [ClientData]?
    public var responseType: String?
    public var timestamp: Int?
}

public struct ClientData: Codable {
    let avgPrice: String
    let cncUsedQuantity, collateralQty: Int
    let collateralType: String
    let collateralUpdateQty: Int
    let companyName: String
    let haircut: Double
    let holdingsUpdateQty: Int
    let isin, product: String
    let quantity: Int
    let symbol: String
    let t1HoldingQty: Int
    let tokenBse, tokenNse: String
    let withheldCollateralQty, withheldHoldingQty: Int
    let ltp, close: Double
    
    
    func currentValueItem() -> Double {
        return ltp * Double(quantity)
    }
    
    func investmentValueItem() -> Double {
        return (Double(avgPrice) ?? 0.0) * Double(quantity)
    }
    
    func profitLoss() -> Double {
        return currentValueItem() - investmentValueItem()
    }
}
