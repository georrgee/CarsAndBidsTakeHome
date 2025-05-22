//  AuctionViewModel.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25.

import Foundation

@MainActor
class AuctionViewModel: ObservableObject {
    
    @Published var auctions: [Auction] = []
    @Published var isLoading: Bool     = false
    @Published var errorMessage: Error?
    
    private let service = AuctionService.shared
    
    func fetchAuctions() async {
        isLoading = true
        
        do {
            let fetchedAuctions = try await service.fetchAuctions()
            print("Fetched auctions: \(fetchedAuctions.map { $0.title })")
            self.auctions = fetchedAuctions
            print("Updated auctions count in view model: \(self.auctions.count)")
            self.isLoading = false
        } catch {
            print("Fetch error: \(error)")
            self.errorMessage = error
            self.isLoading = false
        }
    }
}
