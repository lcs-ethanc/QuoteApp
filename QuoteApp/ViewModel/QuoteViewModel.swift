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
    
    //MARK: Initialiser
    init(currentQuote: Quote? = nil) {
        self.currentQuote = currentQuote
    }
    
    //MARK: Function
    
    func fetchQuote() async{
        
        //Create URL from provided address (check if valid URL)
        let endpoint = "https://api.forismatic.com/api/1.0/?method=getQuote&key=457653&format=json&lang=en"
        guard let url = URL(string: endpoint) else{
            print("Invalid address for JSON endpoint")
            return
        }
    }
    
}
