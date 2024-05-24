//
//  BlockWalletModel.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 22/05/24.
//

import Foundation

//https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin&category=layer-1&per_page=200&price_change_percentage=24h

struct BlockWalletModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice, marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldins: Double?
    
    
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldins
        
    }
    
    struct SparklineIn7D: Codable {
        let price: [Double]?
    }
    
    static let example = BlockWalletModel(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 69653, marketCap: 1373609241326, marketCapRank: 1, fullyDilutedValuation: 1464107689774, totalVolume: 31247225741, high24H: 70585, low24H: 69302, priceChange24H: 12.72, priceChangePercentage24H:  0.01827, marketCapChange24H: 2733349875, marketCapChangePercentage24H: 0.19939, circulatingSupply: 19701962, totalSupply: 21000000, maxSupply: 21000000, ath: 73738, athChangePercentage: -5.39903, athDate: "2024-03-14T07:10:36.635Z", atl: 67.81, atlChangePercentage:  102772.4866, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2024-05-22T20:26:30.217Z", sparklineIn7D: SparklineIn7D(price: [0.1,0.2]), priceChangePercentage24HInCurrency: 0.01827061182731493, currentHoldins: 0.0)
    
}

/*
 "id": "bitcoin",
    "symbol": "btc",
    "name": "Bitcoin",
    "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
    "current_price": 69653,
    "market_cap": 1373609241326,
    "market_cap_rank": 1,
    "fully_diluted_valuation": 1464107689774,
    "total_volume": 31247225741,
    "high_24h": 70585,
    "low_24h": 69302,
    "price_change_24h": 12.72,
    "price_change_percentage_24h": 0.01827,
    "market_cap_change_24h": 2733349875,
    "market_cap_change_percentage_24h": 0.19939,
    "circulating_supply": 19701962,
    "total_supply": 21000000,
    "max_supply": 21000000,
    "ath": 73738,
    "ath_change_percentage": -5.39903,
    "ath_date": "2024-03-14T07:10:36.635Z",
    "atl": 67.81,
    "atl_change_percentage": 102772.4866,
    "atl_date": "2013-07-06T00:00:00.000Z",
    "roi": null,
    "last_updated": "2024-05-22T20:26:30.217Z",
    "price_change_percentage_24h_in_currency": 0.01827061182731493
  },
 */
