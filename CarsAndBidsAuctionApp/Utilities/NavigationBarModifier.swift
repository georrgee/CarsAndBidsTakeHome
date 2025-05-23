//  NavigationBarModifier.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/22/25.

import SwiftUI

/// A view modifier that customizes the appearance of the navigation bar.
struct NavigationBarModifier: ViewModifier {
    
    // MARK: - Properies
    var tintColor: UIColor

    init(tintColor: UIColor) {
        self.tintColor = tintColor
                
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBackground
        appearance.titleTextAttributes = [.foregroundColor: UIColor.label]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        appearance.backButtonAppearance = backButtonAppearance
        
        appearance.shadowColor = nil

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = tintColor
    }
    
    // MARK: - Functions
    func body(content: Content) -> some View {
        content
    }
}
