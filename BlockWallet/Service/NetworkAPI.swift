//
//  NetworkAPI.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 22/05/24.
//

import Foundation

enum APError: Error{
    
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}


class NetworkAPI{
    
    static let shared = NetworkAPI()
    
    static let urlBaseMarket = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&sparkline=true&price_change_percentage=24h"
    

    static let urlBaseGlobal = "https://api.coingecko.com/api/v3/coins/bitcoin?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false"
    
    //OBTENCIÓN DE LISTA DE COINS
    func getList(completed: @escaping (Result<[BlockWalletModel], APError>) -> Void){
        
        guard let url = URL(string: NetworkAPI.urlBaseMarket) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error{
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode <= 300 else{
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
              //  decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedResponse = try decoder.decode([BlockWalletModel].self, from: data)
                completed(.success(decodedResponse))
            }catch{
                print("Debug: Posible Error \(error.localizedDescription)")
                completed(.failure(.decodingError))
            }
        }
        task.resume()
    }
    
    
    //OBTENCIÓN DE DESCRIPCIÓN DE COINS
    func getListOfGlobal(id: String,completed: @escaping (Result<CoinDetailModel, APError>) -> Void){
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error{
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode <= 300 else{
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
              //  decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedResponse = try decoder.decode(CoinDetailModel.self, from: data)
                completed(.success(decodedResponse))
            }catch{
                print("Debug: Posible Error \(error.localizedDescription)")
                completed(.failure(.decodingError))
            }
        }
        task.resume()
    }
    
}
