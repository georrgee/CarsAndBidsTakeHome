//  ContentView.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25

import SwiftUI
import Foundation

struct ContentView: View {

    @StateObject private var auctionViewModel = AuctionViewModel()

    var body: some View {

        NavigationStack {
            
            VStack(spacing: 0) {
                HStack {
                    Text("cars")
                        .font(.custom("Rubik-Medium", size: 28))
                    + Text("&")
                        .font(.custom("Rubik-Medium", size: 30))
                        .foregroundStyle(.green)
                    + Text("bids")
                       .font(.custom("Rubik-Medium", size: 28))
                    
                    Spacer()
                }.padding()

                VStack(alignment: .leading) {

                    Text("Auctions")
                        .font(.custom("Rubik-Medium", size: 18))
                        .padding(.leading)

                    if auctionViewModel.isLoading {
                        
                        VStack {
                            Spacer()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                    } else if let error = auctionViewModel.errorMessage {
                        
                        VStack {
                            Spacer()
                            Text("Error: \(error.localizedDescription)")
                                .foregroundColor(.red)
                                .padding()
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        
                    } else if auctionViewModel.auctions.isEmpty {
                        
                        VStack {
                            Spacer()
                            Text("No auctions available.")
                                .foregroundColor(.gray)
                                .padding()
                            Spacer()
                        }.frame(maxWidth: .infinity)
                    }
                    
                    else {
                        List {
                            ForEach(auctionViewModel.auctions) { auction in
                                AuctionRow(auction: auction)
                                    .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                    .listRowSeparator(.hidden)
                            }
                        }
                        .listStyle(PlainListStyle())
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .onAppear {
                    Task {
                        await auctionViewModel.fetchAuctions()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
