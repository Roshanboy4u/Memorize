//
//  CardView.swift
//  Memorize
//
//  Created by Roshan sah on 04/07/20.
//  Copyright © 2020 Roshan sah. All rights reserved.
//

import SwiftUI

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
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: Constant.cornerRadius)
                        .fill()
                }
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
