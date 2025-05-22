//  Auction.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25.

struct Auction: Codable, Identifiable {
    
    let id:            Int
    let documentId:    String
    let title:         String
    let subtitle:      String
    let auctionId:     String
    let createdAt:     String
    let updatedAt:     String
    let publishedAt:   String
    let numBids:       Int
    let numComments:   Int
    let highBid:       Int
    let auctionUrl:    String
    let auctionEnd:    String
    let auctionStatus: String
    let mainImage:     MainImage?
    
    enum CodingKeys: String, CodingKey {
        case id, documentId, title, subtitle
        case createdAt, updatedAt, publishedAt
        
        case auctionId     = "auction_id"
        case numBids       = "num_bids"
        case numComments   = "num_comments"
        case highBid       = "high_bid"
        case auctionUrl    = "auction_url"
        case auctionEnd    = "auction_end"
        case auctionStatus = "auction_status"
        case mainImage     = "main_image"
    }
}

struct MainImage: Codable {
    let id:         Int
    let documentId: String
    let url:        String
    let formats:    ImageFormats

    enum CodingKeys: String, CodingKey {
        case id, documentId, formats, url
    }
}

struct ImageFormats: Codable {
    let large:     ImageFormat
    let small:     ImageFormat
    let medium:    ImageFormat
    let thumbnail: ImageFormat
}

struct ImageFormat: Codable {
    let url:    String
    let width:  Int
    let height: Int

    enum CodingKeys: String, CodingKey {
        case url, width, height
    }
}
