//  AuctionDetailView.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/22/25.

import SwiftUI
struct AuctionDetailView: View {

  @State private var isLoading = true
  let auction: Auction

  var body: some View {

    ZStack {
      if isLoading {
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle())
          .padding()
      }

      if let url = URL(string: auction.auctionUrl) {
        WebView(isLoading: $isLoading, url: url)
          .opacity(isLoading ? 0 : 1)
          .navigationTitle(auction.title)
          .navigationBarTitleDisplayMode(.inline)
      } else {
        Text("Invalid URL")
          .foregroundStyle(.red)
          .padding()
      }
    }
    .modifier(NavigationBarModifier(tintColor: .black))
  }
}
