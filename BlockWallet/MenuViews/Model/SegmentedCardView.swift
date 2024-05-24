//
//  SegmentedCardView.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 22/05/24.
//

import SwiftUI

struct SegmentedCardView: View {
    @State var title = "Title"
    var isActive: Bool = true
    var color: Color
    var onPressed: (() ->())?
    
    
    var body: some View {
        Button{
            onPressed?()
        }label: {
            VStack{
                VStack{
                    VStack{
                        Rectangle()
                            .foregroundColor(color)
                            .frame(height: 3)
                            .shadow(radius: 10)
                        
                        Text(title)
                            .font(.headline)
                        
                    }
                    .padding(15)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    
                    Image(systemName: "plus.circle.fill")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.gray)
                        .padding(5)
                    
                }
                
                .frame(maxWidth: .infinity)
                .background(Color("BlueOpacity"))
                .opacity(0.9)
                .cornerRadius(10)
                
            }
            .frame(width: 120)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 1)
            )
            .shadow(radius: 10)
        }
        .foregroundColor(.black)
    }
}

#Preview {
    SegmentedCardView(color: .red)
}
