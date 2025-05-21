//  AuctionItem.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25.

import SwiftUI

struct AuctionItem: View {
    
    let auction: Auction
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(auction.title)
                .font(.custom("Rubik-Regular", size: 14, relativeTo: .headline))
        }
    }
}

struct AuctionRow_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AuctionItem(auction: Auction(id: 15,
                     documentId: "gs2oqot6ch0tp0fhfgoct29l",
                     title: "2003 BMW M5",
                     subtitle: "Supercharged Dinan S3 #23, 1 Owner, Texas-Owned, Le Mans Blue",
                     auctionId: "35LzjbVY",
                     createdAt: "2025-05-14T17:34:26.092Z",
                     updatedAt: "2025-05-14T22:00:03.042Z",
                     publishedAt: "2025-05-14T22:00:03.198Z",
                     numBids: 149,
                     numComments: 371,
                     highBid: 117500,
                     auctionUrl: "https://carsandbids.com/auctions/35LzjbVY/2003-bmw-m5",
                     auctionEnd: "2024-10-16T18:24:00.000Z",
                     auctionStatus: "sold"))
    }
}
