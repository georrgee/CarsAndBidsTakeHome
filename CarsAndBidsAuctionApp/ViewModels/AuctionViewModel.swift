//  AuctionViewModel.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25.

import Foundation

class AuctionViewModel: ObservableObject {
    
    @Published var auctions: [Auction] = []
    @Published var isLoading: Bool     = false
    @Published var errorMessage: Error?
    
    private let service = AuctionService.shared
    
    func fetchAuctions() async {
        
        isLoading = true
        
        Task {
            do {
                let fetchedAuctions = try await service.fetchAuctions()
                
                await MainActor.run {
                    self.auctions = fetchedAuctions
                    self.isLoading = false
                }
                
            } catch {
                
                await MainActor.run {
//                    self.errorMessage = "Failed to load auctions: \(error.localizedDescription)" as! any Error
                    self.errorMessage = errorMessage
                    self.isLoading    = false
                }
            }
        }
    }
}
