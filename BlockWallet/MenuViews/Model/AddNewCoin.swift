//
//  AddNewCoin.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 23/05/24.
//

import SwiftUI

struct AddNewCoin: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: BlockWalletViewModel
    @State private var isActiveCoin: BlockWalletModel? = nil
    
    @State var numberCoin = ""
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading){
                    SearchCoinView(search: $viewModel.search)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack(spacing: 10){
                            ForEach(viewModel.filteredCoins){coin in
                                VStack{
                                AsyncImage(url: URL(string: coin.image)){image in
                                    image
                                        .resizable()
                                        .frame(width: 50,height: 50)
                                }placeholder: {
                                    ProgressView()
                                        .frame(width: 50,height: 50)
                                }
                                
                                    Text(coin.symbol.uppercased())
                                    Text(coin.name)
                                        .font(.caption)
                                        .opacity(0.8)
                            }
                                .padding(10)
                                .frame(width: 80)
                                .onTapGesture {
                                    withAnimation(.bouncy){
                                        isActiveCoin = coin
                                    }
                                }
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(isActiveCoin?.id == coin.id ? .blue : .clear, lineWidth: 1)
                                )
                              
                            }
                        }
                    }
                   
                 
                    
                    if isActiveCoin != nil{
                        
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Precio Actual de \(isActiveCoin?.symbol.uppercased() ?? "" ):")
                                Spacer()
                                
                                Text("$\(isActiveCoin?.currentPrice ?? 0.0, specifier: "%.2f")")
                                
                                
                            }
                            .padding(.horizontal)
                            
                            HStack{
                                Text("Cantidad en tu portafolio")
                                
                              Spacer()
                                
                                TextField("ejem. 2.3", text: $numberCoin)
                                    .keyboardType(.decimalPad)
                                    
                            }
                            .padding()
                            HStack{
                                Text("Precio Actual:")
                                
                                Spacer()
                                
                                Text("$\(getCurrentPrice(), specifier: "%.2f")")
                            }
                            .padding()
                        }
                        .padding()
                    }
                
                }
                .navigationTitle(isActiveCoin?.name ?? "Edición de Portafolio")
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        Button("Cancelar"){
                            dismiss()
                        }
                    }
                    if !numberCoin.isEmpty{
                        ToolbarItem(placement: .topBarTrailing){
                            Button("Guardar"){
                                viewModel.addCoin(coin: isActiveCoin!)
                                dismiss()
                            }
                        }
                    }
                }
               
            }
        }
    }
    private func getCurrentPrice() -> Double{
        if let numberCoins = Double(numberCoin){
            return numberCoins * (isActiveCoin?.currentPrice ?? 0.0)
        }
        return 0
    }
}

#Preview {
    AddNewCoin()
        .environmentObject(BlockWalletViewModel())
}
