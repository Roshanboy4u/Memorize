//
//  ContentView.swift
//  Memorize
//
//  Created by Roshan sah on 26/05/20.
//  Copyright © 2020 Roshan sah. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return HStack {
            ForEach(0..<5) { row in
                CardView(faceUp: true)
            }
            
        }.padding()
        .foregroundColor(.orange)
        .font(.largeTitle)
    }
}

struct CardView: View {
    var faceUp: Bool
    var body: some View {
        ZStack {
            if faceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 10)
                .fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

