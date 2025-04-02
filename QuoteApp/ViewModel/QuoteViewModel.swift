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
        
        //Get data
        do{
            //Fetch
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //Print
            print("Got data from endpoint, contents of response are:")
            print(String(data: data, encoding: .utf8)!)
            
            //Decode into swift data type
            
            //create decoder
            let decoder = JSONDecoder()
            
            let decodedData = try decoder.decode(Quote.self, from: data)
            
            //decoding good = return data
            self.currentQuote = decodedData
        } catch{
            
            //Show an error
            print("Count not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
            print("----")
            
            print(error)
        }
    }
    
}
