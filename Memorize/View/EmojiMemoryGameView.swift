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
        return HStack {
            ForEach(viewModel.cards) { currentCard in
                CardView(card: currentCard)
                    .onTapGesture {
                        self.viewModel.choose(card: currentCard)
                }
            }
            
        }.padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(geometry)
        }
    }
    
    fileprivate func body(_ geometry: GeometryProxy) -> some View {
        return ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: Constant.cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: Constant.cornerRadius)
                    .stroke(lineWidth: Constant.lineWidth)
                Text("\(self.card.content)")
            } else {
                RoundedRectangle(cornerRadius: Constant.cornerRadius)
                    .fill()
            }
        }
        .font(Font.system(size: self.getFontSize(withGeometry: geometry)))
    }
    
    private func getFontSize(withGeometry geometry: GeometryProxy) -> CGFloat {
        return min(geometry.size.width, geometry.size.height) * Constant.fontScaleFactor
    }
    
    // MARK:- Drawing Constant
    struct Constant {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScaleFactor: CGFloat = 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

