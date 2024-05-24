//
//  FavoriteView.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 23/05/24.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var viewModel: BlockWalletViewModel
        
        var body: some View {
        
                
                if viewModel.favoriteCoins.count > 0{
                    
                List(viewModel.favoriteCoins) { coin in
                    
                    HStack {
                        VStack(alignment: .leading) {
                                Text(coin.name)
                                    .font(.headline)
                                Text("\(coin.currentPrice ?? 0.0, specifier: "%.2f") USD")
                                    .font(.subheadline)
                        }
                        Spacer()
                        
                        AsyncImage(url: URL(string: coin.image)){image in
                        image
                            .resizable()
                            .frame(width: 40, height: 40)
                        }placeholder: {
                            ProgressView()
                        }
                    }
                    .swipeActions{
                        Button{
                            viewModel.deleteCoinFavorites(id: coin.id)
                        }label: {
                            Label("Borrar", systemImage: "trash")
                                .tint(.red)
                        }
                    }
                    }
                }else{
                    HStack{
                        Image(systemName: "star")
                        Text("Aún no tiene Coins Favoritos")
                            .font(.title2)
                            .bold()
                    }
                    .padding(.bottom)
                }
             
        }
}

#Preview {
    FavoriteView()
        .environmentObject(BlockWalletViewModel())
}
