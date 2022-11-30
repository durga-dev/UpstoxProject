//
//  HomeViewModel.swift
//  UpStocksProject
//
//  Created by Durga Ballabha Panigrahi on 29/11/22.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func viewDidLoad()
    var updateHoldingData: ((UpStockHoldingMapperProtocol?) -> ())? { get set }
}

public class HomeViewModel: HomeViewModelProtocol {
    var updateHoldingData: ((UpStockHoldingMapperProtocol?) -> ())?
    
    init() {
        
    }
    
    func viewDidLoad() {
        getHoldings()
    }
    
    private func getHoldings() {
        let getHoldingRequest = UpStockHoldingRequestModel()
        NetworkApiHelper.shared.getHoldingsAPI(
            parameter: getHoldingRequest) { [weak self] reponse in
                DispatchQueue.main.async {
                    guard let reponse = reponse else {
                        self?.updateHoldingData?(nil)
                        return
                    }
                    
                    self?.updateHoldingData?(reponse)
                }
            }
    }
}
