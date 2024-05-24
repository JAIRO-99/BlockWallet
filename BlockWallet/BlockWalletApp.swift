//
//  BlockWalletApp.swift
//  BlockWallet
//
//  Created by Jairo Laurente on 22/05/24.
//

import SwiftUI

@main
struct BlockWalletApp: App {
    var body: some Scene {
        WindowGroup {
            PrincipalView()
        }
        .environmentObject(BlockWalletViewModel())
    }
}
