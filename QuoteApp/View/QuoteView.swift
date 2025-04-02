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
    @State var buttonTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    // MARK: Computed Properties
    var body: some View {
        VStack{
            
            //show joke if exist
            if let currentQuote = viewModel.currentQuote {
                Group{
                    Text(currentQuote.quoteText)
                        .padding(.bottom,100)
                    
                    Text(currentQuote.quoteAuthor)
                    
                }
                .font(.title)
                .multilineTextAlignment(.center)
            }
            Button{
                //Hide button
                withAnimation{
                    viewModel.currentQuote = nil
                    buttonOpacity = 0.0
                }
                
                //Get new joke
                Task {
                    await viewModel.fetchQuote()
                }
                
                //Restart timer
                buttonTimer = Timer.publish(every: 5, on: .main, in: .common) .autoconnect()
            } label: {
                Text("New Quote")
            }
            .buttonStyle(.borderedProminent)
            .opacity(buttonOpacity)
            .onReceive(buttonTimer) { _ in
                withAnimation{
                    buttonOpacity = 1.0
                }
                //Stop Timer
                buttonTimer.upstream.connect().cancel()
            }
        }
    }
}

#Preview {
    QuoteView()
}


