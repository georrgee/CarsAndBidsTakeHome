//  Formatters.swift
//  CarsAndBidsAuctionApp
//  Created by George Garcia on 5/22/25

import Foundation

/// A utility struct that provides formatting functions for various data types
struct Formatters {

    /// Formats an integer price value into a human-readable string with proper decimal formatting
    ///
    /// - Parameter price: The integer price value to format, typically in cents
    /// - Returns: A formatted string representation of the price with thousands separators
    static func formatPrice(_ price: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: price)) ?? "\(price)"
    }

    /// Creates a date formatter configured for ISO 8601 dates used in the API
    ///
    /// - Returns: A DateFormatter configured with the ISO 8601 format used in the app
    private static func createISODateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter
    }

    /// Converts an ISO 8601 date string into a simplified date format to display on the UI
    ///
    /// - Parameter dateString: The ISO 8601 formatted date string to convert
    /// - Returns: A formatted date string (e.g., "5/22/25")
    static func formatDate(_ dateString: String) -> String {
        guard let date = parseDate(dateString) else {
            return dateString
        }

        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "M/d/yy"
        return displayFormatter.string(from: date)
    }

    /// Parses an ISO 8601 date string into a Date object, used for data processing and filtering logic
    ///
    /// - Parameter dateString: The ISO 8601 formatted date string to parse
    /// - Returns: A Date object if parsing succeeds, or nil if the string cannot be parsed
    static func parseDate(_ dateString: String) -> Date? {
        return createISODateFormatter().date(from: dateString)
    }
}
