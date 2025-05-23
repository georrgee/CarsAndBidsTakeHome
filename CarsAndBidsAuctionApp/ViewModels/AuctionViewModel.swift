//  AuctionViewModel.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/22/25

import Foundation

/// A view model that manages auction data and user interactions for auction listings
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
    @Published var favoriteAuctionIds: Set<String> = Set(
        UserDefaults.standard.stringArray(forKey: "favoriteAuctions") ?? [])

    private let service = AuctionService.shared

    /// Defines the types of date filters available for auction filtering
    enum DateFilterType: String, CaseIterable, Identifiable {
        case created = "Created Date"
        case ended = "End Date"

        var id: String { self.rawValue }
    }
    
    /// Fetches auctions from the API or cache
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

    /// Filters auctions based on the current search text and date filter
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

    /// Clears all search inputs and resets the filtered auctions to show all auctions.
    func clearSearchInput() {
        searchText = ""
        searchDate = nil
        dateFilterType = .created
        isSearching = false
        filteredAuctions = auctions
    }

    /// Checks if an auction is marked as a favorite
    ///
    /// - Parameter auction: The auction to check.
    /// - Returns: `true` if the auction is a favorite, `false` otherwise
    func isFavorite(_ auction: Auction) -> Bool {
        return favoriteAuctionIds.contains("\(auction.id)")
    }

    /// Toggles the favorite status of an auction.
    func toggleFavorite(_ auction: Auction) {

        if favoriteAuctionIds.contains("\(auction.id)") {
            favoriteAuctionIds.remove("\(auction.id)")
        } else {
            favoriteAuctionIds.insert("\(auction.id)")
        }
        
        UserDefaults.standard.set(Array(favoriteAuctionIds), forKey: "favoriteAuctions")
    }
}
