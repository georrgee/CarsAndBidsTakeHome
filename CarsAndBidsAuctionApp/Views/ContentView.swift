//  ContentView.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/21/25

import SwiftUI
import Foundation

struct ContentView: View {

    @StateObject private var auctionViewModel = AuctionViewModel()
    @State private var showDatePicker         = false

    var body: some View {

        NavigationStack {
            
            VStack(spacing: 0) {
                HStack {
                    Text("cars")
                        .font(.custom("Rubik-Medium", size: 28))
                    + Text("&")
                        .font(.custom("Rubik-Medium", size: 30))
                        .foregroundStyle(.green)
                    + Text("bids")
                       .font(.custom("Rubik-Medium", size: 28))
                    
                    Spacer()
                }.padding()

                VStack(spacing: 10) {
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.gray)

                            TextField("Search", text: $auctionViewModel.searchText)
                                .onChange(of: auctionViewModel.searchText) {
                                    auctionViewModel.filterAuctions()
                                }

                            if !auctionViewModel.searchText.isEmpty {
                                Button(action: {
                                    auctionViewModel.searchText = ""
                                    auctionViewModel.filterAuctions()
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)

                        Button(action: {
                            showDatePicker.toggle()
                        }) {
                            Image(
                                systemName: auctionViewModel.searchDate != nil
                                    ? "calendar.badge.clock" : "calendar"
                            )
                            .foregroundStyle(auctionViewModel.searchDate != nil ? .green : .primary)
                            .frame(width: 40, height: 40)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 12)

                    if showDatePicker {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Filter by month:")
                                .font(.custom("Rubik-Regular", size: 14))
                                .foregroundStyle(.secondary)
                            
                            Picker("Date Type", selection: $auctionViewModel.dateFilterType) {
                                ForEach(AuctionViewModel.DateFilterType.allCases) { type in
                                    Text(type.rawValue).tag(type)
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .padding(.vertical, 5)
                            .onChange(of: auctionViewModel.dateFilterType) {
                                if auctionViewModel.searchDate != nil {
                                    auctionViewModel.filterAuctions()
                                }
                            }
                            
                            DatePicker(
                                "Select Month",
                                selection: Binding(
                                    get: { auctionViewModel.searchDate ?? Date() },
                                    set: { auctionViewModel.searchDate = $0 }
                                ),
                                displayedComponents: [.date]
                            )
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .onChange(of: auctionViewModel.searchDate) {
                                auctionViewModel.filterAuctions()
                            }
                            
                            HStack {
                                Spacer()
                                Button("Clear Month") {
                                    auctionViewModel.searchDate = nil
                                    auctionViewModel.filterAuctions()
                                }
                                .foregroundStyle(.red)
                                
                                Button("Done") {
                                    showDatePicker = false
                                }
                                .foregroundStyle(.blue)
                                .padding(.leading, 20)
                            }
                            .padding(.top, 5)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }

                    if auctionViewModel.isSearching {
                        HStack {
                            Text("Showing filtered results")
                                .font(.custom("Rubik-Regular", size: 14))
                                .foregroundStyle(.secondary)

                            Spacer()

                            Button("Clear All Filters") {
                                auctionViewModel.clearSearchInput()
                            }
                            .font(.custom("Rubik-Medium", size: 14))
                            .foregroundStyle(.blue)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical, 20)

                VStack(alignment: .leading) {

                    Text("Auctions")
                        .font(.custom("Rubik-Medium", size: 18))
                        .padding(.leading)

                    if auctionViewModel.isLoading {
                        
                        VStack {
                            Spacer()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                    } else if let error = auctionViewModel.errorMessage {
                        
                        VStack {
                            Spacer()
                            Text("Error: \(error.localizedDescription)")
                                .foregroundStyle(.red)
                                .padding()
                            Spacer()
                        }.frame(maxWidth: .infinity)
                        
                        
                    } else if auctionViewModel.filteredAuctions.isEmpty {
                        
                        VStack {
                            Spacer()
                            Text("No auctions available.")
                                .foregroundStyle(.gray)
                                .padding()
                            Spacer()
                        }.frame(maxWidth: .infinity)
                    }
                    
                    else {
                        List {
                            ForEach(auctionViewModel.filteredAuctions) { auction in
                                AuctionRow(auction: auction)
                                    .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                    .listRowSeparator(.hidden)
                            }
                        }
                        .listStyle(PlainListStyle())
                        .refreshable { 
                            await auctionViewModel.fetchAuctions(forceRefresh: true)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .onAppear {
                    Task {
                        await auctionViewModel.fetchAuctions()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}
