//
//  UserView.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 24/05/24.
//

import SwiftUI

struct UserView: View {
    @State var isActive = false
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.purple.opacity(0.6), Color("BluePrincipal")], startPoint: .topLeading, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                
                Image("bw")
                    .resizable()
                    .frame(width: 300,height: 300)
                    .clipShape(Circle())
                
                Text("Block Wallet")
                    .font(.title)
                    .padding()
                    .bold()
                    .foregroundColor(.white)
                                }
            .onAppear{
                withAnimation(.easeInOut(duration: 0.8)) {
                    isActive.toggle()
                }
            }
        }
        
    }
}

#Preview {
    UserView()
}
