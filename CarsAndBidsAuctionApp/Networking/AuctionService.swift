//  AuctionService.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/22/25

import Foundation
import Combine

/// A service class responsible for fetching and managing auction data
/// The cache expiration will happen after 5 minutes
class AuctionService: ObservableObject {
    
    // MARK: - Properties
    @Published var auctions: [Auction] = []
    
    private var cachedAuctions: [Auction] = []
    private var lastFetchedTime: Date?
    private let cacheExpirationInterval: TimeInterval = 300
    static let shared = AuctionService()

    // MARK: - Functions
    
    /// Fetches a list of auctions from the API or returns cached data if available
    ///
    /// - Parameter forceRefresh: If set to `true`, ignores the cache and forces a network request
    /// - Returns: An array of `Auction` objects
    func fetchAuctions(forceRefresh: Bool = false) async throws -> [Auction] {

        if !forceRefresh,
            !cachedAuctions.isEmpty,
            let lastFetch = lastFetchedTime,
            Date().timeIntervalSince(lastFetch) < cacheExpirationInterval {
            
            return cachedAuctions
        }

        let url       = APIConstants.auctionGroupsURL()
        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            let auctionsGroupsResponse = try JSONDecoder().decode(AuctionGroupsResponse.self, from: data)
            self.cachedAuctions        = auctionsGroupsResponse.data.auctions
            self.lastFetchedTime       = Date()
            
            return auctionsGroupsResponse.data.auctions
        } catch {
            print("Decoding error from fetchAuctions function (AuctionService.swift): \(error)")
            throw error
        }
    }
    
    /// Fetches a specific auction by its ID
    ///
    /// - Parameter auctionId: The unique identifier of the auction to fetch
    /// - Returns: The requested `Auction` object
    func fetchAuctionById(auctionId: String) async throws -> Auction {

        if let cachedAuction = cachedAuctions.first(where: { $0.auctionId == auctionId }) {
            return cachedAuction
        }

        let url = APIConstants.auctionByIdURL(id: auctionId)

        let (data, _) = try await URLSession.shared.data(from: url)
        let response  = try JSONDecoder().decode(AuctionResponse.self, from: data)

        guard let auction = response.data.first else {
            throw URLError(.badServerResponse)
        }

        return auction
    }

    /// Clears the cached auction data
    func clearCache() {
        cachedAuctions = []
        lastFetchedTime = nil
    }
}
