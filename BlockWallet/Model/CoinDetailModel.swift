//
//  CoinDetailModel.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 23/05/24.
//

import Foundation
import SwiftUI


//https://api.coingecko.com/api/v3/coins/bitcoin?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false

struct CoinDetailModel:Identifiable,Codable {
    let id, symbol, name: String
    let blockTimeInMinutes: Int
    let hashingAlgorithm: String
    let categories: [String]
    let description: Description
    let links: Links
    
    enum CodingKeys: String, CodingKey {
            case id, symbol, name
            case blockTimeInMinutes = "block_time_in_minutes"
            case hashingAlgorithm = "hashing_algorithm"
            case categories
            case description, links
        }
}

// MARK: - Description
struct Description:Codable {
    let en: String
}
// MARK: - Links
struct Links: Codable {
    let homepage: [String]
}
