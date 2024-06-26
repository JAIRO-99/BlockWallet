//
//  PrincipalView.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 22/05/24.
//

import SwiftUI

struct PrincipalView: View {
    
    @StateObject private var viewModel = BlockWalletViewModel()
    let tabIcons = ["house","star","person"]
    @State var indexSelectedIcons = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack{
                    switch indexSelectedIcons {
                        case 0:
                        NavigationStack{
                            ContentView()
                        }
                        
                        
                        case 1:
                        NavigationView{
                            FavoriteView()
                        }
                        .navigationTitle("Favoritos")
                    default:
                        NavigationView{
                            UserView()
                        }
                        .navigationTitle("Usuario")
                        }
                    }
                Spacer()
                HStack{
                    ForEach(0..<3){ icon in
                        Spacer()
                        Button{
                            self.indexSelectedIcons = icon
                        }label: {
                            
                            if indexSelectedIcons == icon{
                                Image(systemName: tabIcons[icon])
                                    .frame(width: 60,height: 60)
                                    .background(Color("BluePrincipal"))
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                                    .padding(.horizontal)
                            }else{
                                Image(systemName: tabIcons[icon])
                                    .font(.title)
                                    .padding(.horizontal)
                                    .foregroundColor(.black)
                            }
                        }
                        Spacer()
                    }
                }
            }
            .environmentObject(viewModel)
        }
    }
}

#Preview {
    PrincipalView()
}
