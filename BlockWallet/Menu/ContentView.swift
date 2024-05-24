//
//  ContentView.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 22/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = BlockWalletViewModel()
    @State var isActive = false
    
    var body: some View {
        VStack{
            ZStack(alignment: .bottom){
                Rectangle()
                    .frame(height: 100)
                    .cornerRadius(10)
                    .foregroundColor(Color("BlueOpacity"))
                
                SearchCoinView(search: $viewModel.search)
                    .offset(y:8)
                ZStack(alignment: .topTrailing){
                    
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 400)
                        .foregroundColor(Color("BluePrincipal"))
                        .cornerRadius(25)
                        .ignoresSafeArea()
                    
                    Text("Price online")
                        .padding(.trailing,145)
                        .font(.headline)
                    
                    Button{
                        isActive = true
                    }label: {
                        Image(systemName: "plus")
                            .frame(width: 50,height: 50)
                            .foregroundColor(.black)
                            .background(.white)
                            .clipShape(Circle())
                    }
                    
                    .padding()
                    
                    
                    //
                }
                
                HStack{
                    SegmentedCardView(title: "Market cup",color: .green)
                    SegmentedCardView(title: "24h Vol.",color: .red)
                    SegmentedCardView(title: "Dominance",color: .blue)
                }
                .padding(.bottom,80)
                
                
                
            }
            
            
            
            List{
                ForEach(viewModel.filteredCoins, id: \.id){ coin in
                    NavigationLink{
                        CoinDetailView(blockWallet: coin)
                            .environmentObject(viewModel)
                    }label:{
                        CoinListView(blockWallet: coin)
                            .swipeActions{
                                Button{
                                    viewModel.deleteCoin(id: coin.id)
                                }label: {
                                    Label("Borrar", systemImage: "trash")
                                        .tint(.red)
                                }
                            }
                    }
                    
                }
                
            }
            
            .listStyle(PlainListStyle())
            
        }
        .sheet(isPresented: $isActive) {
            AddNewCoin()
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    ContentView()
      
}
