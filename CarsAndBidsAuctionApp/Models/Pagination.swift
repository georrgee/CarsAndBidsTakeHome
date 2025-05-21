//  Pagination.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25.

struct Pagination: Codable {
    let page: Int
    let pageSize: Int
    let pageCount: Int
    let total: Int
}
