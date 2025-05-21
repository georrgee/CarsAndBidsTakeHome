//  ContentView.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25

import SwiftUI
import Foundation

struct Auction: Codable, Identifiable {
    let id: Int
    let documentId: String
    let title: String
    let subtitle: String
    let auctionId: String
    let createdAt: String
    let updatedAt: String
    let publishedAt: String
    let numBids: Int
    let numComments: Int
    let highBid: Int
    let auctionUrl: String
    let auctionEnd: String
    let auctionStatus: String
    
    enum CodingKeys: String, CodingKey {
        case id, documentId, title, subtitle
        case auctionId = "auction_id"
        case createdAt, updatedAt, publishedAt
        case numBids = "num_bids"
        case numComments = "num_comments"
        case highBid = "high_bid"
        case auctionUrl = "auction_url"
        case auctionEnd = "auction_end"
        case auctionStatus = "auction_status"
    }
}

struct Meta: Codable {
    let pagination: Pagination
}

struct Pagination: Codable {
    let page: Int
    let pageSize: Int
    let pageCount: Int
    let total: Int
}

struct AuctionResponse: Codable {
    let data: [Auction]
    let meta: Meta
}

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
