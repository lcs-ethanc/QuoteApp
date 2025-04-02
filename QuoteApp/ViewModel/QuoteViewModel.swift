//
//  QuoteViewModel.swift
//  QuoteApp
//
//  Created by Pak Ching Ethan Chen on 2025-04-02.
//

import Foundation

@Observable
class QuoteViewModel {
    
    //MARK: Stored Properties
    //Most recent quote
    var currentQuote: Quote?
    
    init(currentQuote: Quote? = nil) {
        self.currentQuote = currentQuote
    }
}
