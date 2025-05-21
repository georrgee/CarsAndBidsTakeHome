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

/*
            {
                "id": 15,
                "documentId": "gs2oqot6ch0tp0fhfgoct29l",
                "title": "2003 BMW M5",
                "subtitle": "Supercharged Dinan S3 #23, 1 Owner, Texas-Owned, Le Mans Blue",
                "auction_id": "35LzjbVY",
                "createdAt": "2025-05-14T17:34:26.092Z",
                "updatedAt": "2025-05-14T22:00:03.042Z",
                "publishedAt": "2025-05-14T22:00:03.198Z",
                "num_bids": 149,
                "num_comments": 371,
                "high_bid": 117500,
                "auction_url": "https://carsandbids.com/auctions/35LzjbVY/2003-bmw-m5",
                "auction_end": "2024-10-16T18:24:00.000Z",
                "auction_status": "sold",
                "main_image": {
                    "id": 12,
                    "documentId": "qek24ew15zhsyqqv785tg9wz",
                    "name": "3LwnGymY-zIDdRm-Dedl2-2-GsoPnQWhIk.jpg",
                    "alternativeText": null,
                    "caption": null,
                    "width": 2080,
                    "height": 1386,
                    "formats": {
                        "large": {
                            "ext": ".jpg",
                            "url": "https://majestic-unity-3468c4b683.media.strapiapp.com/large_3_Lwn_Gym_Y_z_I_Dd_Rm_Dedl2_2_Gso_Pn_Q_Wh_Ik_7dd693c4ad.jpg",
                            "hash": "large_3_Lwn_Gym_Y_z_I_Dd_Rm_Dedl2_2_Gso_Pn_Q_Wh_Ik_7dd693c4ad",
                            "mime": "image/jpeg",
                            "name": "large_3LwnGymY-zIDdRm-Dedl2-2-GsoPnQWhIk.jpg",
                            "path": null,
                            "size": 127.67,
                            "width": 1000,
                            "height": 666,
                            "sizeInBytes": 127666
                        },
                        "small": {
                            "ext": ".jpg",
                            "url": "https://majestic-unity-3468c4b683.media.strapiapp.com/small_3_Lwn_Gym_Y_z_I_Dd_Rm_Dedl2_2_Gso_Pn_Q_Wh_Ik_7dd693c4ad.jpg",
                            "hash": "small_3_Lwn_Gym_Y_z_I_Dd_Rm_Dedl2_2_Gso_Pn_Q_Wh_Ik_7dd693c4ad",
                            "mime": "image/jpeg",
                            "name": "small_3LwnGymY-zIDdRm-Dedl2-2-GsoPnQWhIk.jpg",
                            "path": null,
                            "size": 35.16,
                            "width": 500,
                            "height": 333,
                            "sizeInBytes": 35162
                        },
                        "medium": {
                            "ext": ".jpg",
                            "url": "https://majestic-unity-3468c4b683.media.strapiapp.com/medium_3_Lwn_Gym_Y_z_I_Dd_Rm_Dedl2_2_Gso_Pn_Q_Wh_Ik_7dd693c4ad.jpg",
                            "hash": "medium_3_Lwn_Gym_Y_z_I_Dd_Rm_Dedl2_2_Gso_Pn_Q_Wh_Ik_7dd693c4ad",
                            "mime": "image/jpeg",
                            "name": "medium_3LwnGymY-zIDdRm-Dedl2-2-GsoPnQWhIk.jpg",
                            "path": null,
                            "size": 74.99,
                            "width": 750,
                            "height": 500,
                            "sizeInBytes": 74994
                        },
                        "thumbnail": {
                            "ext": ".jpg",
                            "url": "https://majestic-unity-3468c4b683.media.strapiapp.com/thumbnail_3_Lwn_Gym_Y_z_I_Dd_Rm_Dedl2_2_Gso_Pn_Q_Wh_Ik_7dd693c4ad.jpg",
                            "hash": "thumbnail_3_Lwn_Gym_Y_z_I_Dd_Rm_Dedl2_2_Gso_Pn_Q_Wh_Ik_7dd693c4ad",
                            "mime": "image/jpeg",
                            "name": "thumbnail_3LwnGymY-zIDdRm-Dedl2-2-GsoPnQWhIk.jpg",
                            "path": null,
                            "size": 8.89,
                            "width": 234,
                            "height": 156,
                            "sizeInBytes": 8892
                        }
                    },
                    "hash": "3_Lwn_Gym_Y_z_I_Dd_Rm_Dedl2_2_Gso_Pn_Q_Wh_Ik_7dd693c4ad",
                    "ext": ".jpg",
                    "mime": "image/jpeg",
                    "size": 472.37,
                    "url": "https://majestic-unity-3468c4b683.media.strapiapp.com/3_Lwn_Gym_Y_z_I_Dd_Rm_Dedl2_2_Gso_Pn_Q_Wh_Ik_7dd693c4ad.jpg",
                    "previewUrl": null,
                    "provider": "strapi-provider-upload-strapi-cloud",
                    "provider_metadata": null,
                    "createdAt": "2025-05-14T17:39:40.693Z",
                    "updatedAt": "2025-05-14T17:39:40.693Z",
                    "publishedAt": "2025-05-14T17:39:40.694Z"
                }
            },

*/
