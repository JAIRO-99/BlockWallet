//
//  DataNetwork.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 23/05/24.
//

import Foundation
import CoreData

class DataNetwork{
    
     let container: NSPersistentContainer
    private let containerName = "DataCoin"
    private let entityName = "CoinEntity"
    
    static let shared = DataNetwork()
    
    @Published var savedEntities: [CoinEntity] = []
    
    //agregado
    var viewContext: NSManagedObjectContext{
        return container.viewContext
    }
    
    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores{(_, error) in
            if let error = error {
                print("Debug: Error loading Data \(error)")
            }
        }
    }
    
    private func getCoinBlock(){
        let request = NSFetchRequest<CoinEntity>(entityName: entityName)
        do{
            savedEntities = try container.viewContext.fetch(request)
        }catch let error {
            print("Debug: Error fetching coin entities \(error)")
        }
    }
    
    private func add(coin: BlockWalletModel, amount: Double){
        let entity = CoinEntity(context: container.viewContext)
        entity.coinID = coin.id
        entity.currentAmount = amount
    }
    
     func save(){
        do{
            try container.viewContext.save()
        }catch let error{
            print("Error saving to Core Data. \(error)")
        }
    }
}
