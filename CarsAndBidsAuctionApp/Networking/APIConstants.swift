//  APIConstants.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25.

import Foundation

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
    
    static func auctionGroupsURL() -> URL {
        return URL(string: "\(baseURL)\(Endpoints.auctionGroups)?\(QueryParams.populateAuctionsWithMainImage)")!
    }
    
    static func auctionByIdURL(id: String) -> URL {
        return URL(string: "\(baseURL)\(Endpoints.auctions)?\(QueryParams.filterByAuctionId)\(id)")!
    }
}
