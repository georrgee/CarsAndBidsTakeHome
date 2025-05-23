//  Pagination.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/22/25

/// A model representing pagination information for API responses
struct Pagination: Codable {
    let page: Int
    let pageSize: Int
    let pageCount: Int
    let total: Int
}
