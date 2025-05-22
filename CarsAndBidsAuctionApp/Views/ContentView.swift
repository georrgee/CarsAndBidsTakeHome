//  ContentView.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25

import SwiftUI
import Foundation

struct ContentView: View {
    
    @StateObject private var auctionViewModel = AuctionViewModel()
    
    var body: some View {

        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Text("cars")
                        .font(.custom("Rubik-Medium", size: 28))
                        .foregroundStyle(.black)
                    + Text("&")
                        .font(.custom("Rubik-Medium", size: 30))
                        .foregroundStyle(.green)
                    + Text("bids")
                       .font(.custom("Rubik-Medium", size: 28))
                       .foregroundStyle(.black)

                    Spacer()
                }.padding()
                
                VStack(alignment: .leading) {
                    
                    Text("Auctions")
                        .font(.custom("Rubik-Medium", size: 18))
                        .padding(.leading)

                    List {
                        ForEach(auctionViewModel.auctions) { auction in
                            AuctionItem(auction: auction)
                        }
                    }
                    .onAppear {
                        Task {
                            await auctionViewModel.fetchAuctions()
                        }
                    }
                    
                    .listStyle(PlainListStyle())
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    ContentView()
}
