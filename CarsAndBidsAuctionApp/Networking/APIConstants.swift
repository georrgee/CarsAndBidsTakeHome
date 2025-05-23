//  APIConstants.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/22/25.

import Foundation

/// A collection of constants and utility methods for API communication.
struct APIConstants {

    static let baseURL = "https://sbffr.carsandbids.com/api"

    struct Endpoints {
        static let auctionGroups = "/auction-groups/myvj0bjns2k55kvwuuukalb1"
        static let auctions = "/auctions"
    }
    
    struct QueryParams {
        static let populateAuctionsWithMainImage = "populate[0]=auctions.main_image"
        static let filterByAuctionId = "filters[auction_id][$eq]="
    }

    /// Builds the URL for fetching auction groups with their main images
    ///
    /// - Returns: The URL for the auction groups endpoint with the appropriate query parameters
    static func auctionGroupsURL() -> URL {
        return URL(string: "\(baseURL)\(Endpoints.auctionGroups)?\(QueryParams.populateAuctionsWithMainImage)")!
    }

    /// Constructs the URL for fetching a specific auction by its ID
    ///
    /// - Parameter id: The unique identifier of the auction to fetch
    /// - Returns: The URL for the auctions endpoint with filtering by the specified auction ID
    static func auctionByIdURL(id: String) -> URL {
        return URL(string: "\(baseURL)\(Endpoints.auctions)?\(QueryParams.filterByAuctionId)\(id)")!
    }
}
