//  NavigationBarModifier.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/22/25.

import SwiftUI

struct NavigationBarModifier: ViewModifier {

    var tintColor: UIColor

    init(tintColor: UIColor) {
        
        self.tintColor = tintColor
        let appearance = UINavigationBarAppearance()

        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBackground

        appearance.titleTextAttributes      = [.foregroundColor: UIColor.label]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.label]

        appearance.backButtonAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.clear
        ]

        appearance.shadowColor = nil

        UINavigationBar.appearance().standardAppearance   = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance    = appearance
        UINavigationBar.appearance().tintColor            = self.tintColor
    }

    func body(content: Content) -> some View {
        content
    }
}
