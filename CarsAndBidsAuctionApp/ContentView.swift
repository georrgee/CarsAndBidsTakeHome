//  ContentView.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25

import SwiftUI

struct ContentView: View {

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
                        Text("Auction Item 1")
                        Text("Auction Item 2")
                    }
                    .listStyle(PlainListStyle())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    ContentView()
}
