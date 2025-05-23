//  CarsAndBidsAuctionAppApp.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/22/25.

import SwiftUI

@main
struct CarsAndBidsAuctionAppApp: App {
    var body: some Scene {
        WindowGroup {
            AuctionListView()
                .environmentObject(AuctionService.shared)
        }
    }
}
