//  AuctionService.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25.

import Foundation
import Combine

class AuctionService: ObservableObject {
    
    // MARK: - State Variables
    @Published var auctions: [Auction] = []
    
    // MARK: - Variables
    private var cachedAuctions: [Auction] = []
    private var lastFetchTime: Date?
    private let cacheExpirationInterval: TimeInterval = 300  
    static let shared = AuctionService()

    // MARK: - Methods
    func fetchAuctions(forceRefresh: Bool = false) async throws -> [Auction] {

        if !forceRefresh, !cachedAuctions.isEmpty, let lastFetch = lastFetchTime,
            Date().timeIntervalSince(lastFetch) < cacheExpirationInterval
        {
            return cachedAuctions
        }

        let url = APIConstants.auctionGroupsURL()

        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            let response = try JSONDecoder().decode(AuctionGroupsResponse.self, from: data)
            self.cachedAuctions = response.data.auctions
            self.lastFetchTime = Date()
            return response.data.auctions
        } catch {
            print("Decoding error: \(error)")
            throw error
        }
    }
    
    func fetchAuctionById(auctionId: String) async throws -> Auction {

        if let cachedAuction = cachedAuctions.first(where: { $0.auctionId == auctionId }) {
            print("Using cached auction data for ID: \(auctionId)")
            return cachedAuction
        }

        let url = APIConstants.auctionByIdURL(id: auctionId)

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(AuctionResponse.self, from: data)

        guard let auction = response.data.first else {
            throw URLError(.badServerResponse)
        }

        return auction
    }

    /** @description: clears the cache */
    func clearCache() {
        cachedAuctions = []
        lastFetchTime = nil
    }
}
