//  AuctionItem.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25.

import SwiftUI

struct AuctionItem: View {
    
    let auction: Auction
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {

            ZStack(alignment: .bottomLeading) {

                if let mainImage = auction.mainImage {
                    
                    AsyncImage(url: URL(string: mainImage.formats.medium.url)) { phase in
                        
                        switch phase {
                            
                        case .empty:
                            Rectangle()
                                .fill(Color.purple.opacity(0.3))
                            
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                        case .failure:
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .overlay(
                                    Image(systemName: "photo")
                                        .foregroundColor(.gray)
                                )
                        @unknown default:
                            Rectangle()
                                .fill(Color.pink.opacity(0.3))
                        }
                    }
                    .aspectRatio(1.5, contentMode: .fit)
                    .cornerRadius(8)
                    .clipped()
                } else {
                    Rectangle()
                        .fill(Color.blue.opacity(0.3))
                        .aspectRatio(1.5, contentMode: .fit)
                        .cornerRadius(8)
                }
                
                if auction.auctionStatus == "sold" {
                    HStack {
                        Text("Sold for $\(Formatters.formatPrice(auction.highBid))")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                    }
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(4)
                    .padding(15)
                }
                
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(auction.title)
                    .font(.custom("Rubik-Medium", size: 16))
                    .foregroundColor(.primary)
                
                Text(auction.subtitle)
                    .font(.custom("Rubik-Regular", size: 14))
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Text("Ended \(Formatters.formatDate(auction.auctionEnd))")
                    .font(.custom("Rubik-Regular", size: 14))
                    .foregroundColor(.gray)
                    .padding(.top, 2)
            }
//            .padding(.horizontal, 15)
//            .padding(.vertical, 10)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
    }
}

struct AuctionRow_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AuctionItem(auction: Auction(id: 15,
                     documentId: "gs2oqot6ch0tp0fhfgoct29l",
                     title: "2003 BMW M5",
                     subtitle: "Supercharged Dinan S3 #23, 1 Owner, Texas-Owned, Le Mans Blue",
                     auctionId: "35LzjbVY",
                     createdAt: "2025-05-14T17:34:26.092Z",
                     updatedAt: "2025-05-14T22:00:03.042Z",
                     publishedAt: "2025-05-14T22:00:03.198Z",
                     numBids: 149,
                     numComments: 371,
                     highBid: 117500,
                     auctionUrl: "https://carsandbids.com/auctions/35LzjbVY/2003-bmw-m5",
                     auctionEnd: "2024-10-16T18:24:00.000Z",
                     auctionStatus: "sold",
                     mainImage: MainImage(
                        id: 12,
                        documentId: "qek24ew15zhsyqqv785tg9wz",
                        url: "https://majestic-unity-3468c4b683.media.strapiapp.com/3_Lwn_Gym_Y_z_I_Dd_Rm_Dedl2_2_Gso_Pn_Q_Wh_Ik_7dd693c4ad.jpg",
                        formats: ImageFormats(
                            large: ImageFormat(
                                url: "https://majestic-unity-3468c4b683.media.strapiapp.com/large_3_Lwn_Gym_Y_z_I_Dd_Rm_Dedl2_2_Gso_Pn_Q_Wh_Ik_7dd693c4ad.jpg",
                                width: 1000,
                                height: 666
                            ),
                            small: ImageFormat(
                                url: "https://majestic-unity-3468c4b683.media.strapiapp.com/small_3_Lwn_Gym_Y_z_I_Dd_Rm_Dedl2_2_Gso_Pn_Q_Wh_Ik_7dd693c4ad.jpg",
                                width: 500,
                                height: 333
                            ),
                            medium: ImageFormat(
                                url: "https://majestic-unity-3468c4b683.media.strapiapp.com/medium_3_Lwn_Gym_Y_z_I_Dd_Rm_Dedl2_2_Gso_Pn_Q_Wh_Ik_7dd693c4ad.jpg",
                                width: 750,
                                height: 500
                            ),
                            thumbnail: ImageFormat(
                                url: "https://majestic-unity-3468c4b683.media.strapiapp.com/thumbnail_3_Lwn_Gym_Y_z_I_Dd_Rm_Dedl2_2_Gso_Pn_Q_Wh_Ik_7dd693c4ad.jpg",
                                width: 234,
                                height: 156
                            )
                        ))))
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color(.systemBackground))
    }
}
