//  AuctionViewModel.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25.

import Foundation

@MainActor
class AuctionViewModel: ObservableObject {
    
    @Published var auctions: [Auction]         = []
    @Published var filteredAuctions: [Auction] = []

    @Published var isLoading: Bool    = false
    @Published var searchText: String = ""
    @Published var isSearching: Bool  = false
    @Published var isRefreshing: Bool = false

    
    @Published var errorMessage: Error?
    @Published var searchDate: Date?
    @Published var dateFilterType: DateFilterType = .created

    enum DateFilterType: String, CaseIterable, Identifiable {
        case created = "Created Date"
        case ended = "End Date"

        var id: String { self.rawValue }
    }

    private let service = AuctionService.shared
    
    func fetchAuctions(forceRefresh: Bool = false) async {

        if forceRefresh {
            isRefreshing = true
        } else {
            isLoading = true
        }

        do {
            let fetchedAuctions = try await service.fetchAuctions(forceRefresh: forceRefresh)
            self.auctions = fetchedAuctions
            self.filteredAuctions = fetchedAuctions
            self.isLoading = false
            self.isRefreshing = false
        } catch {
            print("Fetch error: \(error)")
            self.errorMessage = error
            self.isLoading = false
            self.isRefreshing = false
        }
    }

    func filterAuctions() {

        isSearching = !searchText.isEmpty || searchDate != nil

        if !isSearching {
            filteredAuctions = auctions
            return
        }

        filteredAuctions = auctions.filter { auction in

            var matchesTitle = true
            var matchesDate  = true

            if !searchText.isEmpty {
                matchesTitle = auction.title.lowercased().contains(searchText.lowercased())
            }

            if let searchDate = searchDate {
                let dateString = dateFilterType == .created ? auction.createdAt : auction.auctionEnd
                if let date = Formatters.parseDate(dateString) {
                    let calendar = Calendar.current
                    matchesDate =
                        calendar.component(.month, from: date)
                        == calendar.component(.month, from: searchDate)
                        && calendar.component(.year, from: date)
                            == calendar.component(.year, from: searchDate)
                }
            }

            return matchesTitle && matchesDate
        }
    }

    func clearSearchInput() {
        searchText = ""
        searchDate = nil
        dateFilterType = .created
        isSearching = false
        filteredAuctions = auctions
    }
}
