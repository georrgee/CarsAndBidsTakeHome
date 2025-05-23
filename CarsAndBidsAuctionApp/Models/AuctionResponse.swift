//  AuctionResponse.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/22/25

import Foundation

/// A response model that contains a collection of auctions and metadata
struct AuctionResponse: Codable {
    let data: [Auction]
    let meta: Meta
}

/// A response model that contains auction groups data and metadata
struct AuctionGroupsResponse: Codable {
    let data: AuctionGroupData
    let meta: Meta
}

/// A model representing a group of auctions with associated metadata
struct AuctionGroupData: Codable {
    let id: Int
    let documentId: String
    let name: String
    let createdAt: String
    let updatedAt: String
    let publishedAt: String
    let auctions: [Auction]
}
