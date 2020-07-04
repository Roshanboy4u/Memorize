//
//  ContentView.swift
//  Memorize
//
//  Created by Roshan sah on 26/05/20.
//  Copyright © 2020 Roshan sah. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        return Grid(viewModel.cards) { currentCard in
                CardView(card: currentCard)
                    .onTapGesture {
                        self.viewModel.choose(card: currentCard)
                }
                .padding(10)
            
        }.padding()
        .foregroundColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

