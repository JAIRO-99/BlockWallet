//
//  CoinListView.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 22/05/24.
//

import SwiftUI

struct CoinListView: View {
    
    let blockWallet: BlockWalletModel
    
    var body: some View {
        HStack{
            Text("\(Int(blockWallet.marketCapRank ?? 0))")
            
            AsyncImage(url: URL(string: blockWallet.image)){image in
                image
                    .resizable()
                    .frame(width: 25,height: 25)
            }placeholder: {
                ProgressView()
                    .frame(width: 25,height: 25)
            }
            
            Text(blockWallet.symbol.uppercased())
            
            Spacer()
            
            VStack(alignment: .trailing){
                Text("\(blockWallet.currentPrice ?? 0.0,specifier: "%.2f")")
                Text("\(blockWallet.priceChangePercentage24H ?? 0.0,specifier: "%.2f")%")
                    .foregroundColor(blockWallet.priceChangePercentage24H ?? 0.0 >= 0 ? .green : .red)
                    .bold()
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CoinListView(blockWallet: BlockWalletModel.example)
}
