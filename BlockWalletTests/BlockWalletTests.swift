//
//  BlockWalletTests.swift
//  BlockWalletTests
//
//  Created by Jairo Laurente on 23/05/24.
//

//
//  BlockWalletTests.swift
//  BlockWalletTests
//
//  Created by Jairo Laurente on 23/05/24.
//

import XCTest
@testable import BlockWallet

final class BlockWalletTests: XCTestCase {
    
    func testBlockWalletInitialization(){
        
        //Given or Arranque
        
        let id = "bitcoin"
        let symbol = "btc"
        let name = "bitcoin"
        let image = "image"
        let currentPrice = 1.0
        let marketCap = 2.0
        let marketCapRank = 3.0
        let fullyDilutedValuation = 4.0
        let totalVolume = 5.0
        let high24H = 6.0
        let low24H = 7.0
        let priceChange24H = 8.0
        let priceChangePercentage24H = 9.0
        let marketCapChange24H = 10.0
        let marketCapChangePercentage24H = 11.0
        let circulatingSupply = 12.0
        let totalSupply = 13.0
        let maxSupply = 14.0
        let ath = 15.0
        let athChangePercentage = 16.0
        let athDate = "01/05/2024"
        let atl = 17.0
        let atlChangePercentage = 18.0
        let atlDate = "01/05/2024"
        let lastUpdated = "03/05/2024"
        let priceChangePercentage24HInCurrency = 19.0
        let currentHoldins = 20.0
        
        //when or Act
        
        let coin = BlockWalletModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: nil, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldins: currentHoldins)
        
            //then or Assert
        
        XCTAssertEqual(coin.id, id)
        XCTAssertEqual(coin.symbol, symbol)
        XCTAssertEqual(coin.name, name)
        XCTAssertEqual(coin.image, image)
        XCTAssertEqual(coin.currentPrice, currentPrice)
        XCTAssertEqual(coin.marketCap, marketCap)
        XCTAssertEqual(coin.marketCapRank, marketCapRank)
        XCTAssertEqual(coin.fullyDilutedValuation, fullyDilutedValuation)
        XCTAssertEqual(coin.totalVolume, totalVolume)
        XCTAssertEqual(coin.high24H, high24H)
        XCTAssertEqual(coin.low24H, low24H)
        XCTAssertEqual(coin.priceChange24H, priceChange24H)
        XCTAssertEqual(coin.priceChangePercentage24H, priceChangePercentage24H)
        XCTAssertEqual(coin.marketCapChange24H, marketCapChange24H)
        XCTAssertEqual(coin.marketCapChangePercentage24H, marketCapChangePercentage24H)
        XCTAssertEqual(coin.circulatingSupply, circulatingSupply)
        XCTAssertEqual(coin.totalSupply, totalSupply)
        XCTAssertEqual(coin.maxSupply, maxSupply)
        XCTAssertEqual(coin.ath, ath)
        XCTAssertEqual(coin.athChangePercentage, athChangePercentage)
        XCTAssertEqual(coin.athDate, athDate)
        XCTAssertEqual(coin.atl, atl)
        XCTAssertEqual(coin.atlChangePercentage, atlChangePercentage)
        XCTAssertEqual(coin.atlDate, atlDate)
        XCTAssertEqual(coin.lastUpdated, lastUpdated)
        XCTAssertEqual(coin.priceChangePercentage24HInCurrency, priceChangePercentage24HInCurrency)
        XCTAssertEqual(coin.currentHoldins, currentHoldins)
    }
   
    
    /*
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
*/
}
