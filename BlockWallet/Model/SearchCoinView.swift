//
//  SearchCoinView.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 22/05/24.
//

import SwiftUI

struct SearchCoinView: View {
    
    @Binding var search: String
   
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            HStack{
                TextField("Buscar Coin", text: $search)
                    
                if !search.isEmpty{
                Image(systemName: "xmark.app.fill")
                        .onTapGesture {
                            search = ""
                        }
                    }
            }
            .padding(10)
            .overlay(
                
                RoundedRectangle(cornerRadius: 25)
                    .stroke(.black, lineWidth: 1)
            )
        }
        .padding()
    }
}

#Preview {
    SearchCoinView(search: .constant(""))
}
