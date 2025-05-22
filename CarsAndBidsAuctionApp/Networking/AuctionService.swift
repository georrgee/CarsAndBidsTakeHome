//  AuctionService.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25.

import Foundation
import Combine

class AuctionService: ObservableObject {
    
    // MARK: - State Variables
    @Published var auctions: [Auction] = []
    
    // MARK: - Variables
    static let shared = AuctionService()

    // MARK: - Methods
    /* @description: fetches all auctions */
    
    func fetchAuctions() async throws -> [Auction] {
        
        let url = URL(string: "https://sbffr.carsandbids.com/api/auction-groups/myvj0bjns2k55kvwuuukalb1?populate[0]=auctions.main_image")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
                
        do {
            let response = try JSONDecoder().decode(AuctionGroupsResponse.self, from: data)
            return response.data.auctions
            
        } catch {
            print("Decoding error: \(error)")
            throw error
        }
    }
    
    /** @description: fetches an auction based on the id */
    func fetchAuctionById(auctionId: String) async throws -> Auction  {
        
        let url = URL(string: "https://sbffr.carsandbids.com/api/auctions?filters[auction_id][$eq]=\(auctionId)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(AuctionResponse.self, from: data)
        
        guard let auction = response.data.first else {
            throw URLError(.badServerResponse)
        }
        
        return auction
    }
}
