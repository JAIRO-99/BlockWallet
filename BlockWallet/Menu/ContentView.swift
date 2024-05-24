//
//  ContentView.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 22/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: BlockWalletViewModel
    @State var isActive = false
    @State var coinGlobal = 0
    
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
                    SegmentedCardView(title: "Market cup",color: .green){
                        coinGlobal = 0
                    }
                    SegmentedCardView(title: "24h Vol.",color: .red){
                        coinGlobal = 1
                    }
                    SegmentedCardView(title: "C. Price",color: .blue) {
                        coinGlobal = 2
                    }
                   
                }
                .padding(.bottom,80)
                
                switch coinGlobal{
                case 0:
                    VStack{
                        Text("$\(viewModel.coinGlobal?.marketCap ?? 0.0,specifier: "%.2f")")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                        HStack{
                            Image(systemName: viewModel.coinGlobal?.priceChangePercentage24H ?? 0.0 >= 0 ? "triangle.fill" : "arrowtriangle.down.fill")
                               // .resizable()
                                .foregroundColor(viewModel.coinGlobal?.priceChangePercentage24H ?? 0.0 >= 0 ? .green : .red)
                            Text("\(viewModel.coinGlobal?.marketCapChangePercentage24H ?? 0.0)")
                                .foregroundColor(viewModel.coinGlobal?.priceChangePercentage24H ?? 0.0 >= 0 ? .green : .orange )
                                .bold()
                        }
                    }
                    .padding(.bottom,250)
                case 1:
                    Text("$\(viewModel.coinGlobal?.marketCapChange24H ?? 0.0)")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .padding(.bottom,250)
                default:
                    Text("\(viewModel.coinGlobal?.currentPrice ?? 0.0,specifier: "%.2f")USD")
                        .foregroundColor(.white)
                        .font(.title)
                        .bold()
                        .padding(.bottom,250)
                }
                   
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
        .environmentObject(BlockWalletViewModel())
}
