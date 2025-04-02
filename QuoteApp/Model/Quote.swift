//
//  Quote.swift
//  QuoteApp
//
//  Created by Pak Ching Ethan Chen on 2025-03-31.
//

import Foundation

struct Quote: Identifiable, Codable {
    
    // MARK: Stored properties
    let quoteText: String
    let quoteAuthor: String
    let senderName: String
    let senderLink: String
    let id = UUID()
}


//Example quote for testing

let exampleQuote = Quote(
    quoteText: "quoteText",
    quoteAuthor: "Author Name",
    senderName: "Sender Name",
    senderLink: " Sender Link"
)
