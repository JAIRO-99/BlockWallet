//
//  BlockWalletViewModel.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 22/05/24.
//

import Foundation
import CoreData

class BlockWalletViewModel: ObservableObject{
    
    @Published var coins: [BlockWalletModel] = []
    @Published var global: CoinDetailModel?
    @Published var search = "".lowercased()
    
    private let service = NetworkAPI.shared
  //  private let dataNetwork = DataNetwork()
    
     var filteredCoins:[BlockWalletModel]{
        guard !search.isEmpty else {return coins}
        return coins.filter {$0.id.localizedCaseInsensitiveContains(search)
        }
    }
    
    init(){
       getListOfCoins()
        
    }
    
    //OBTENIEDO LISTA DE COINS
    func getListOfCoins(){
        service.getList { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let coins):
                    self?.coins = coins
                case .failure(let error):
                    print("Debug: Error \(error.localizedDescription)")
                }
            }
        }
    }
    
    //OBTENIENDO GLOBAL
    func getListOfGlobalDescriptions(id: String){
        service.getListOfGlobal(id: id) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let global):
                    self?.global = global
                case .failure(let error2):
                    print("Debug: Error \(error2.localizedDescription)")
                }
            }
        }
    }
    
    
    
    //AÑADIR COIN A LA LISTA coins
    
    func addCoin(coin: BlockWalletModel){
        let newCoin = BlockWalletModel(id: coin.id, symbol: coin.symbol, name: coin.name, image: coin.image, currentPrice: coin.currentPrice, marketCap: coin.marketCap, marketCapRank: coin.marketCapRank, fullyDilutedValuation: coin.fullyDilutedValuation, totalVolume: coin.totalVolume, high24H: coin.high24H, low24H: coin.low24H, priceChange24H: coin.priceChange24H, priceChangePercentage24H: coin.priceChangePercentage24H, marketCapChange24H: coin.marketCapChange24H, marketCapChangePercentage24H: coin.marketCapChangePercentage24H, circulatingSupply: coin.circulatingSupply, totalSupply: coin.totalSupply, maxSupply: coin.maxSupply, ath: coin.ath, athChangePercentage: coin.athChangePercentage, athDate: coin.athDate, atl: coin.atl, atlChangePercentage: coin.atlChangePercentage, atlDate: coin.atlDate, lastUpdated: coin.lastUpdated, sparklineIn7D: coin.sparklineIn7D, priceChangePercentage24HInCurrency: coin.priceChangePercentage24HInCurrency, currentHoldins: coin.currentHoldins)
        coins.append(newCoin)
        save()
    }
    
    func save(){
        let newCoin = CoinEntity(context: DataNetwork.shared.container.viewContext)
        
        newCoin.coinID = global?.id
        
        DataNetwork.shared.save()
    }
    
    
    //BORRAR COIN DE LA LISTA coins
    func deleteCoin(id: String){
        coins.removeAll(where: {$0.id == id})
    }
}
