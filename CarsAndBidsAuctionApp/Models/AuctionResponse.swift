//  AuctionResponse.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25.

struct AuctionResponse: Codable {
    let data: [Auction]
    let meta: Meta
}

struct AuctionGroupsResponse: Codable {
    let data: AuctionGroupData
    let meta: Meta
}

struct AuctionGroupData: Codable {
    let id: Int
    let documentId: String
    let name: String
    let createdAt: String
    let updatedAt: String
    let publishedAt: String
    let auctions: [Auction]
}
