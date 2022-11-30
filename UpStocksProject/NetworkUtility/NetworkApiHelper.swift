//
//  NetworkApiHelper.swift
//  UpStocksProject
//
//  Created by Durga Ballabha Panigrahi on 29/11/22.
//

import Foundation

public class NetworkApiHelper {
    
    private init() {
        NSLog("NetworkApiHelper Initialized")
    }
    
    public static let shared = NetworkApiHelper()
    
    func getHoldingsAPI(parameter: UpStockHoldingRequestModelProtocol, completion: @escaping (UpStockHoldingMapperProtocol?) -> ()) {
        URLSession.shared.dataTask(with: parameter.request) { data, response, error in
            guard let data = data else {
                return completion(nil)
            }
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let responseData = try jsonDecoder.decode(UpStockHoldingResponseModel.self, from: data)
                let finalResponse = UpStockHoldingMapper(data: responseData)
                completion(finalResponse)
            } catch {
                let errorString = String(describing: error)
                assert(false, errorString)
                return completion(nil)
            }
        }.resume()
    }
}
