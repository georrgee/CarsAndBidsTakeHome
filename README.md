//  README.md
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/22/25

# Cars and Bids Auction App - Take Home Project

This is a SwiftUI application that displays car auctions from the Cars and Bids platform

## Project Overview
This iOS application allows users to browse car auctions and view the details of the auction. The app demonstrates modern iOS development practices including:
- SwiftUI for UI implementation
- MVVM architecture
- Asynchronous image loading
- API integration
- Favorites (basic) functionality

## Features
- Browse car auction listings
- View detailed information about each auction
- Save favorite auctions
- Filter auctions based on title or end dates

## Technical Implementation
### Architecture

The application follows the MVVM (Model-View-ViewModel) architecture:
- **Models**: Data structures like `Auction` that represent the core data
- **Views**: SwiftUI views like `AuctionRow` that display the UI
- **ViewModels**: Handle business logic and data preparation for views

### Key Components
- **AuctionRow**: Displays individual auction listings with image, title, and status
- **AuctionDetailView**: Shows comprehensive information about a selected auction
- **AsyncImage**: Handles asynchronous loading of auction images with loading states

### Data Handling
The app fetches auction data from an API and processes it for display. It includes:
- JSON parsing
- Image caching
- Date and price formatting

## Requirements
- iOS 16.0+
- Xcode 14.0+
- Swift 5.7+

## Running the project
- Just build and run the application on the iOS simulator or a physical device
- Note: On the simulator, it was weird that there was some networking issues, but on a real device (using my personal iPhone 16 pro),
- I had no issues with fetching data on my device

## Future Improvements
If had more time, I would consider adding:
- Unit and UI tests
- Improved error handling
- Pagination for auction listings
- Offline support with Core Data
- Separate UI components in their own respective files

## A big thank you
I appreciate your time and consideration. Thank you for reviewing my take home project!
