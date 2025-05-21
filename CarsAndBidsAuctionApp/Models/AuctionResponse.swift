//  AuctionResponse.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25.

struct AuctionResponse: Codable {
    let data: [Auction]
    let meta: Meta
}
