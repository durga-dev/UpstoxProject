//
//  UpStockHoldingMapper.swift
//  UpStocksProject
//
//  Created by Durga Ballabha Panigrahi on 29/11/22.
//

import Foundation

public protocol UpStockHoldingMapperProtocol: UpStockHoldingResponseModelProtocol {
    var currentValue: Double { get }
    var totalInvestment: Double { get }
    var todayProfitLoss: Double { get }
    var totalProfitLoss: Double { get }
}

public struct UpStockHoldingMapper: UpStockHoldingMapperProtocol {
    
    private let holdingResponse: UpStockHoldingResponseModel
    
    init(data: UpStockHoldingResponseModel) {
        holdingResponse = data
    }
    
    public var clientID: String? {
        holdingResponse.clientID
    }
    
    public var data: [ClientData]? {
        holdingResponse.data
    }
    
    public var responseType: String? {
        holdingResponse.responseType
    }
    
    public var timestamp: Int? {
        holdingResponse.timestamp
    }
    
    public var currentValue: Double {
        data?.reduce(.zero, { partialResult, data in
            partialResult + (data.ltp * Double(data.quantity))
        }) ?? .zero
    }
    
    public var totalInvestment: Double{
        data?.reduce(.zero, { partialResult, data in
            partialResult + (Double(data.avgPrice)! * Double(data.quantity))
        }) ?? .zero
    }
    
    public var todayProfitLoss: Double{
        data?.reduce(.zero, { partialResult, data in
            partialResult + ((data.close - data.ltp)  * Double(data.quantity))
        }) ?? .zero
    }
    
    public var totalProfitLoss: Double{
        currentValue - totalInvestment
    }

}
