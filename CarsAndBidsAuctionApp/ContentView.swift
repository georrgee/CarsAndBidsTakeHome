//  ContentView.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25

import SwiftUI

struct ContentView: View {

    var body: some View {

        NavigationView {
            List {
                Text("Auction Item 1")
                Text("Auction Item 2")
            }.navigationTitle("Auctions")
        }
    }
}

#Preview {
    ContentView()
}
