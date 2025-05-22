//  CarsAndBidsAuctionAppApp.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25.

import SwiftUI

@main
struct CarsAndBidsAuctionAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuctionService.shared)
        }
    }
}
