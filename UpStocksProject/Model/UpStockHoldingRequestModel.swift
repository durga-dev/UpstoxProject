//
//  UpStockHoldingRequestModel.swift
//  UpStocksProject
//
//  Created by Durga Ballabha Panigrahi on 29/11/22.
//

import Foundation

protocol UpStockHoldingRequestModelProtocol {
    var request: URLRequest { get }
}

struct UpStockHoldingRequestModel: UpStockHoldingRequestModelProtocol {
    let baseUrl: URL = URL(string: "https://run.mocky.io/")!
    let path: String = "v3/6d0ad460-f600-47a7-b973-4a779ebbaeaf"
    let httpMethod: String = "GET"
    
    var request: URLRequest {
        let finalURL = baseUrl.appendingPathComponent(path)
        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = httpMethod
        return urlRequest
    }

}
