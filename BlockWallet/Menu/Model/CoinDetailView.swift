//
//  CoinDetailView.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 22/05/24.
//

import SwiftUI

struct CoinDetailView: View {
    var blockWallet: BlockWalletModel
    @EnvironmentObject var viewModel: BlockWalletViewModel
    @State var isFavorite = false
    var body: some View {
        
        ScrollView{
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    Text("Precio de \(blockWallet.name)")
                        .font(.headline)
                    
                    Text("\(blockWallet.currentPrice ?? 0.0, specifier: "%.2f")")
                    
                    HStack{
                        Image(systemName: "arrow.up")
                            .foregroundColor(blockWallet.priceChangePercentage24H ?? 0.0 >= 0 ? .green : .red)
                        Text("\(blockWallet.priceChangePercentage24H ?? 0.0,specifier: "%.2f")%")
                            .foregroundColor(blockWallet.priceChangePercentage24H ?? 0.0 >= 0 ? .green : .red)
                    }
                }
                Text("Sobre \(blockWallet.name)")
                    .font(.title)
                
                if let descriptions = viewModel.global?.description{
                    if !descriptions.en.isEmpty{
                        Text(viewModel.global?.description.en ?? "Falta información sobre la moneda")
                            .lineLimit(6)
                            .padding(.horizontal)
                    }
                }
                
                VStack(alignment: .leading){
                    Text("Estadísticas")
                        .font(.title)
                    
                    Text("Ranking")
                        .font(.headline)
                    Text("#\(blockWallet.marketCapRank ?? 0, specifier: "%.0f")")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.blue)
                    
                    Text("Capitalización del Mercado")
                        .font(.headline)
                    Text("\(blockWallet.marketCap ?? 0.0, specifier: "%.2f") USD")
                    
                VStack{
                    Text("Volume")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("\(blockWallet.totalVolume ?? 0.0,specifier: "%.2f")")
                            .font(.headline)
                    HStack{
                        VStack{
                            Text("24h High")
                                .font(.headline)
                            Text("\(blockWallet.high24H ?? 0.0,specifier: "%.2f")")
                        }
                        Spacer()
                        VStack{
                            Text("24h Low")
                                .font(.headline)
                            Text("\(blockWallet.low24H ?? 0.0, specifier: "%.2f")")
                        }
                    }
                }
                .padding(.top)
                    
                    
                
                        VStack(alignment: .leading){
                            Text("24h Price Change")
                                .font(.headline)
                            Text("$\(blockWallet.priceChange24H ?? 0.0, specifier: "%.2f")")
                                .foregroundColor(.blue)
                            HStack{
                    
                                Image(systemName: blockWallet.priceChangePercentage24H ?? 0.0 >= 0 ? "triangle.fill" : "arrowtriangle.down.fill")
                                   // .resizable()
                                    .foregroundColor(blockWallet.priceChangePercentage24H ?? 0.0 >= 0 ? .green : .red)
                                   // .frame(width: 15,height: 15)
                                Text("\(blockWallet.priceChangePercentage24H ?? 0.0,specifier: "%.2f")")
                                    .foregroundColor(blockWallet.priceChangePercentage24H ?? 0.0 >= 0 ? .green : .red)
                                    .font(.headline)
                            }
                        }
                    
                    .padding(.top)
                }
                .padding()
            }
            .navigationTitle(blockWallet.name)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.getListOfGlobalDescriptions(id: blockWallet.id)
                isFavorite = viewModel.isFavorite(coin: blockWallet)
            }
            
            //MARCAR COMO FAVORITO
            .toolbar{
                Button{
                    viewModel.toggleFavorite(coin: blockWallet)
                   isFavorite = viewModel.isFavorite(coin: blockWallet)
                }label: {
                    Image(systemName:isFavorite ? "star.fill" : "star")
                        .padding()
                        .frame(width: 50)
                        .background(Color("BluePrincipal"))
                        .clipShape(Circle())
                        .foregroundColor(isFavorite ? .yellow : .white)
                        
                        
                }
                
        }
            
        }
        .padding()
    }
}

#Preview {
    CoinDetailView(blockWallet: BlockWalletModel.example)
        .environmentObject(BlockWalletViewModel())
}
