//
//  QuoteView.swift
//  QuoteApp
//
//  Created by Pak Ching Ethan Chen on 2025-04-02.
//

import SwiftUI

struct QuoteView: View {
    // MARK: Stored Properties
    
    //View Model of default joke
    @State var viewModel = QuoteViewModel(currentQuote: exampleQuote)
    
    // Controls button visibility
    @State var buttonOpacity = 0.0
    
    // Timer for button reveal
    @State var buttonTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    // MARK: Computed Properties
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}
